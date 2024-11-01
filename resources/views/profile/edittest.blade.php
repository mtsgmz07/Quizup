<x-base css="profil/edit.css">
    <section class="main__editPersonnel">
        <h2 class="main__editPersonnel__h2">Informations personnelles</h2>
        <form action="{{ route('profile.update') }}" onsubmit="return false" class="main__editPersonnel__form">
            @csrf
            <div class="main__editPersonnel__form__success">
                <p>Les modifications ont bien été enregistrées.</p>
            </div>
            <div class="main__editPersonnel__form__nickname">
                <label for="nicknameId">Pseudo</label>
                <input type="text" placeholder="Entrez un pseudo" maxlength="20" name="nickname" id="nicknameId"
                    value="{{ Auth::user()->nickname }}">
            </div>
            <div class="main__editPersonnel__form__email">
                <label for="emailId">Adresse mail</label>
                <input type="text" placeholder="Entrez une adresse mail" maxlength="255" name="email"
                    id="emailId" value="{{ Auth::user()->email }}">
            </div>
            <button class="main__editPersonnel__form__submit">Enregistrer</button>
        </form>
    </section>

    <script src="{{ asset('assets/js/profil/updateInformation.js') }}"></script>

    <section class="main__editPassword">
        <h2 class="main__editPassword__h2">Mot de passe</h2>
        <form action="{{ route('password.update') }}" onsubmit="return false" class="main__editPassword__form">
            @csrf
            @method('put')
            <div class="main__editPassword__form__success">
                <p>Les modifications ont bien été enregistrées.</p>
            </div>
            <div class="main__editPassword__form__currentPassword">
                <label for="currentPasswordId">Mot de passe actuel</label>
                <input type="password" autocomplete="current-password" placeholder="Entrez le mot de passe actuel"
                    maxlength="20" name="currentPassword" id="currentPasswordId">
                <div class="error">
                    <p>Mot de passe invalide</p>
                </div>
            </div>
            <div class="main__editPassword__form__newPassword">
                <label for="newPasswordId">Nouveau mot de passe</label>
                <input type="password" autocomplete="new-password" placeholder="Entrez le nouveau mot de passe"
                    maxlength="20" name="newPassword" id="newPasswordId">
                <div class="error">
                    <p>Le mot de passe doit contenir 8 caractères minimum</p>
                </div>
            </div>
            <div class="main__editPassword__form__retypePassword">
                <label for="retypePasswordId">Retapez le mot de passe</label>
                <input type="password" autocomplete="new-password" placeholder="Entrez à nouveau le mot de passe"
                    maxlength="20" name="retypePassword" id="retypePasswordId">
                <div class="error">
                    <p>Les deux mot de passe ne corresponde pas</p>
                </div>
            </div>
            <button class="main__editPassword__form__submit" disabled>Enregistrer</button>
        </form>
    </section>

    <script src="{{ asset('assets/js/profil/updatePassword.js') }}"></script>

    <div class="main__deleteAccount">
        <div class="main__deleteAccount__left">
            <h2 class="main__deleteAccount__h2">Suppression du compte</h2>
            <p class="main__deleteAccount__left__p">Attention, cette action est irrévocable, cette dernière engendre la
                perte de toutes vos données depuis sa
                création.</p>
        </div>
        <div class="main__deleteAccount__right">
            <button>Supprimer mon compte</button>
        </div>
    </div>

    <div class="main__popup">
        <section class="main__popup__content">
            <h2>Voulez-vous vraiment supprimer votre compte ?</h2>
            <p>Entrez votre mot de passe ci-dessous pour effectuer la suppression de votre compte.</p>
            <form action="{{ route('profile.destroy') }}" onsubmit="return false" class="main__popup__content__form">
                @csrf
                @method('delete')
                <div class="main__popup__content__form__password">
                    <label for="passwordId"></label>
                    <input type="password" autocomplete="current-password" name="password" id="passwordId"
                        placeholder="Entrez votre mot de passe">
                    <div class="error">
                        <p>Mot de passe invalide</p>
                    </div>
                </div>
                <div class="main__popup__content__form__action">
                    <span class="cancel">Annuler</span>
                    <button class="delete" disabled>Supprimer</button>
                </div>
            </form>
        </section>
    </div>

    <script src="{{ asset('assets/js/profil/deleteAccount.js') }}"></script>
</x-base>
