<x-base css="auth/registerLogin.css">
    <form method="POST" action="{{ route('login') }}">
        @csrf
        <h2>Connexion</h2>
        <div class="formContain">
            <label for="email">Email</label>
            <input type="email" name="email" id="email" class="connectInput" placeholder="Entrez votre email"
                required>
            @error('email')
                <div class="error">{{ $message }}</div>
            @enderror
        </div>
        <div class="formContain">
            <label for="password">Mot de passe</label>
            <input type="password" name="password" id="password" class="connectInput"
                placeholder="Entrez votre mot de passe" required>
            @error('password')
                <div class="error">{{ $message }}</div>
            @enderror
        </div>
        <button class="connectButton">Se connecter</button>
        <p>Vous n'avez pas encore de compte ? <a href="/register">S'inscrire</a></p>
    </form>
</x-base>
