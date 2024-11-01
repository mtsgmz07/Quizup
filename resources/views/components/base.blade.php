@props([
    'css' => '',
])

@php
    use Illuminate\Support\Str;
@endphp

@php
    $currentUrl = request()->path();
@endphp

<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quizup</title>
    <link rel="stylesheet" href="{{ asset('assets/css/base.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/css/' . $css) }}">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&family=Racing+Sans+One&display=swap"
        rel="stylesheet">
    <script src="https://kit.fontawesome.com/9de8273207.js" crossorigin="anonymous" defer></script>
    <link rel="icon" href="{{ asset('assets/img/logo/quizup.png') }}" />
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.css">
    <script src="https://cdn.jsdelivr.net/npm/notyf@3/notyf.min.js"></script>
</head>

<body>
    <header>
        <nav>
            <a href="/" class="header__nav__logo">
                <img src="{{ asset('assets/img/logo/quizup.png') }}" alt="">
                <p>quizUp</p>
            </a>

            @if (!Str::startsWith($currentUrl, 'quiz/game'))
                <ul class="header__nav__middle">
                    <li><a href="/quiz/trend">Tendances</a></li>
                    <li><a href="/quiz/divertissement">Divertissement</a></li>
                    <li><a href="/quiz/apprentissage">Apprentissage</a></li>
                </ul>
            @endif


            @if (!Str::startsWith($currentUrl, 'quiz/game'))
                @if (!Auth::check())
                    <div class="header__nav__connect">
                        <a class="header__nav__connect__icon" href="/login"><i
                                class="fa-regular fa-circle-user"></i></a>
                    </div>
                @endif

                @if (Auth::check())
                    <div class="header__nav__connect">
                        <a href="/dashboard" class="header__nav__connect__myaccount">Mon compte</a>
                    </div>
                @endif
            @else
                <div class="header__nav__connect">
                    <a class="header__nav__connect__icon" href="/quiz/game/leave"><i
                            class="fa-solid fa-arrow-right-from-bracket"></i></a>
                </div>
            @endif


            <button class="header__nav__burger">
                <span></span>
                <span></span>
                <span></span>
            </button>
        </nav>

        <menu>
            @if (!Str::startsWith($currentUrl, 'quiz/game'))
                <div class="header__menu__redirect">
                    <a href="/quiz/trend">Tendances</a>
                    <a href="/quiz/divertissement">Divertissement</a>
                    <a href="/quiz/apprentissage">Apprentissage</a>
                </div>
                @if (!Auth::check())
                    <div class="header__menu__gateway__connexion">
                        <a href="/login">Se connecter</a>
                    </div>
                @endif

                @if (Auth::check())
                    <div class="header__menu__gateway__connexion">
                        <a href="/dashboard">Mon compte</a>
                    </div>
                @endif
            @else
                <div class="header__menu__gateway__connexion">
                    <a href="/quiz/game/leave">Quitter la partie</a>
                </div>
            @endif
        </menu>
        <script src="{{ asset('assets/js/base/header.js') }}"></script>
    </header>
    <main>
        {{ $slot }}
    </main>
    @if (!Str::startsWith($currentUrl, 'quiz/game'))
        <footer>
            <section class="footer_top">
                <section class="footer_aboutMe">
                    <p class="footer_aboutMe_title">À propos de nous</p>
                    <p class="footer_aboutMe_p">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Possimus dolor
                        rem
                        velit, sed praesentium saepe dolores recusandae dolore reprehenderit! Quia molestiae rerum,
                        officiis
                        vel ex neque eveniet nulla recusandae iusto, nesciunt quo commodi! Qui ex neque at labore quae
                        eaque.</p>
                </section>
                <section class="footer_category">
                    <p class="footer_category_title">Menu</p>
                    <div class="footer_category_manager">
                        <a href="">Nouveauté</a>
                        <a href="">Divertissement</a>
                        <a href="">Avertissement</a>
                    </div>
                </section>
                <section class="footer_policies">
                    <p class="footer_policies_title">Nos politiques</p>
                    <div class="footer_category">
                        <div class="footer_category_manager">
                            <a href="/policies/privacy-policy">Politique de confidentialité</a>
                            <a href="/policies/terms-of-service">Conditions d'utilisation</a>
                            <a href="/policies/shipping-policy">Besoin d'aide ?</a>
                        </div>
                    </div>
                </section>
            </section>
            <div class="footer_separation"></div>
            <section class="footer_bottom">
                <p class="footer_bottom_copyright">Copyright © 2024 All Rights Reserved by quizUp.</p>
                <div class="footer_bottom_socialMedia">
                    <a href=""><i class="fa-brands fa-instagram"></i></a>
                    <a href=""><i class="fa-brands fa-x-twitter"></i></a>
                    <a href=""><i class="fa-brands fa-tiktok"></i></a>
                </div>
            </section>
        </footer>
    @endif
</body>

</html>
