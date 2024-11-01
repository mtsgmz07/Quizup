<x-base css="dashboard.css">
    <section class="main__welcome">
        <h1 class="main__welcome__h1">Bienvenue sur votre compte, {{ Auth::user()->nickname }}</h1>
        <form method="POST" action="{{ route('logout') }}" class="main__welcome__form">
            @csrf
            <button>Déconnexion</button>
        </form>
    </section>

    <div class="main__manageProfil">
        <section class="main__manageProfil__left">
            <h2>Gestion de vos données personnelles</h2>
            <p>Cliquez sur le bouton pour accéder à vos informations personnelles.</p>
        </section>
        <div class="main__manageProfil__right">
            <a href="/profile">Gérer mon profil</a>
        </div>
    </div>
    <section class="main__manageHistoryGame">
        <h2 class="main__manageHistoryGame__h2">Vos favoris</h2>
        @if ($favorites->isEmpty())
            <p class="main__manageHistoryGame__any">Aucun favoris</p>
        @else
            <div class="main__manageHistoryGame__manager">
                @foreach ($favorites as $favorite)
                    <div class="main__manageHistoryGame__manager__container div{{ $favorite->id }}">
                        <div class="main__manageHistoryGame__manager__container__button">
                            <a href="/quiz/game/{{ $favorite->id }}" class="play">Jouer</a>
                            <form onsubmit="return false" class="form{{ $favorite->id }}">
                                @csrf
                                <button id="{{ $favorite->id }}_remove" class="favorite"><i
                                        class="fa-solid fa-heart"></i></button>
                            </form>
                        </div>
                        <img src="{{ $favorite->image }}" alt="">
                    </div>
                @endforeach
            </div>
        @endif
    </section>
    <script src="{{ asset('assets/js/dashboard.js') }}"></script>
    <section class="main__manageHistoryGame">
        <h2 class="main__manageHistoryGame__h2">Récemment joué</h2>
        @if ($historys->isEmpty())
            <p class="main__manageHistoryGame__any">Aucun historique</p>
        @else
            <div class="main__manageHistoryGame__manager">
                @foreach ($historys as $history)
                    <div class="main__manageHistoryGame__manager__container div{{ $history->id }}">
                        <div class="main__manageHistoryGame__manager__container__button">
                            <button id="{{ $history->id }}" class="play">Jouer</button>
                        </div>
                        <img src="{{ $history->image }}" alt="">
                    </div>
                @endforeach
            </div>
        @endif
    </section>
    <input type="hidden" value="{{ csrf_token() }}" class="csrfToken" name="_token">
</x-base>
