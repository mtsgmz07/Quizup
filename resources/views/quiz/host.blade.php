<x-base css="quiz/host.css">
    <div class="main__code">
        <h1>{{ $code }}</h1>
        <i id="paste" class="fa-solid fa-copy"></i>
    </div>

    <div class="main__game">
        <div class="main__game__action">
            <button class="launch">Lancer</button>
            <button class="cancel">Annuler</button>
        </div>
        <div class="main__game__managers">
            <div class="main__game__managers__user">
                <p>{{ $nickname }}</p>
            </div>
        </div>
    </div>
    <input type="hidden" name="_token" value="{{ csrf_token() }}" class="csrfToken">
    <script src="{{ asset('assets/js/quiz/host.js') }}"></script>
</x-base>
