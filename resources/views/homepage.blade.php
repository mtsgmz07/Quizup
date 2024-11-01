<x-base css="homepage.css">
    <div class="playgame">
        <img class="playgame__img" src="{{ asset('assets/img/banner/quiz.png') }}" alt="">
        <form method="POST" action="{{ route('join.game') }}" class="playgame__form">
            @csrf
            <h2 class="playgame__form__h2">Rejoindre une partie</h2>
            <input type="text" placeholder="Entrez votre code ici" class="playgame__form__input" maxlength="8" name="code">
            <button type="submit" class="playgame__form__submit">Jouer</button>
        </form>
    </div>

    <script src="{{ asset('assets/js/script.js') }}"></script>
    <div class="demonstration">
        <iframe width="660" height="415" src="https://www.youtube.com/embed/UcHox9jCYW4?si=PGocsqYFs-DnwfhP"
            title="YouTube video player" frameborder="0"
            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
            referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
        <p class="demonstration__p">En savoir plus sur nous !</p>
    </div>
</x-base>
