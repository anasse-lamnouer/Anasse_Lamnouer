import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RegisterPage(),
    );
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Contrôleurs pour les champs de texte
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _telephoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  
  // Variables pour gérer la visibilité des mots de passe
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page d\'Inscription'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Image.asset(
              "assets/Design_sans_titre-removebg-preview.png",
              height: 100,
            ),
            const SizedBox(height: 32.0),
            
            // Champ Nom complet
            TextFormField(
              controller: _nomController,
              decoration: const InputDecoration(
                labelText: 'Nom complet',
                hintText: 'Entrez votre nom complet',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            
            // Champ Email
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            
            // Champ Téléphone
            TextFormField(
              controller: _telephoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Téléphone',
                hintText: '+212 6XX XXX XXX',
                prefixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            
            // Champ Mot de passe
            TextFormField(
              controller: _passwordController,
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                labelText: 'Mot de passe',
                hintText: 'Enter your password',
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            
            // Champ Confirmation mot de passe
            TextFormField(
              controller: _confirmPasswordController,
              obscureText: _obscureConfirmPassword,
              decoration: InputDecoration(
                labelText: 'Confirmer le mot de passe',
                hintText: 'Confirmez votre mot de passe',
                prefixIcon: const Icon(Icons.lock_outline),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureConfirmPassword ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureConfirmPassword = !_obscureConfirmPassword;
                    });
                  },
                ),
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24.0),
            
            // Bouton d'inscription
            ElevatedButton(
              onPressed: () {
                _handleRegistration();
              },
              child: const Text('S\'inscrire'),
            ),
            // "Déjà inscrit ? Se connecter"
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: TextButton(
                onPressed: () {
                  // Logique pour naviguer vers la page de connexion
                },
                child: const Text(
                  'Déjà inscrit ? Se connecter',
                  style: TextStyle(
                    color: Colors.blue,

                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Méthode pour gérer l'inscription
  void _handleRegistration() {
    // Validation basique
    if (_nomController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _telephoneController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _confirmPasswordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Veuillez remplir tous les champs'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }
    
    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Les mots de passe ne correspondent pas'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    
    // Simulation d'inscription réussie
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Inscription réussie !'),
        backgroundColor: Colors.green,
      ),
    );
    
    // Afficher les informations dans la console
    print('=== INSCRIPTION RÉUSSIE ===');
    print('Nom: ${_nomController.text}');
    print('Email: ${_emailController.text}');
    print('Téléphone: ${_telephoneController.text}');
  }

  @override
  void dispose() {
    // Nettoyage des contrôleurs
    _nomController.dispose();
    _emailController.dispose();
    _telephoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}