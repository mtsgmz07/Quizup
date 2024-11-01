<x-base css="auth/registerLogin.css">

    <form method="POST" action="{{ route('register') }}">
        @csrf
        <h2>Inscription</h2>
        <div class="formContain">
            <label for="email">Adresse email</label>
            <input type="email" name="email" id="email" class="connectInput" required
                placeholder="Entrez votre adresse email">
            @error('email')
                <div class="error">{{ $message }}</div>
            @enderror
        </div>
        <div class="formContain">
            <label for="nickname">Pseudo</label>
            <input type="text" name="nickname" id="nickname" class="connectInput" required maxlength="20"
                placeholder="Entrez votre pseudo">
            @error('nickname')
                <div class="error">{{ $message }}</div>
            @enderror
        </div>
        <div class="formContain">
            <label for="password">Mot de passe</label>
            <input type="password" name="password" id="password" class="connectInput" required
                placeholder="Entrez votre mot de passe">
            @error('password')
                <div class="error">{{ $message }}</div>
            @enderror
        </div>
        <div class="formContain">
            <label for="password">Confirmer le mot de passe</label>
            <input type="password" name="password_confirmation" id="password" class="connectInput" required
                placeholder="Entrez à nouveau votre mot de passe">
            @error('password_confirmation')
                <div class="error">{{ $message }}</div>
            @enderror
        </div>
        <button class="connectButton">S'inscrire</button>
        <p>Vous avez un compte ? <a href="/login">Se connecter</a></p>
    </form>

</x-base>
