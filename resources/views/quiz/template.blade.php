<x-base css="quiz/template.css">
    <section class="main__difficult">
        <h2>Niveau facile</h2>
        <div class="main__difficult__manager">
            @foreach ($easy as $container)
                <div class="main__difficult__manager__container">
                    <div class="main__difficult__manager__container__button">
                        <button id="{{ $container->id }}" class="play">Jouer</button>
                        <form onsubmit="return false" class="form{{ $container->id }}">
                            @csrf
                            <button id="{{ $container->id }}{{ $container->favorite ? '_remove' : '_add' }}"
                                class="favorite"><i
                                    class="{{ $container->favorite ? 'fa-solid' : 'fa-regular' }} fa-heart"></i></button>
                        </form>
                    </div>
                    <img src="{{ $container->image }}" alt="">
                </div>
            @endforeach
        </div>
    </section>

    <section class="main__difficult">
        <h2>Niveau moyen</h2>
        <div class="main__difficult__manager">
            @foreach ($medium as $container)
                <div class="main__difficult__manager__container">
                    <div class="main__difficult__manager__container__button">
                        <button id="{{ $container->id }}" class="play">Jouer</button>
                        <form onsubmit="return false" class="form{{ $container->id }}">
                            @csrf
                            <button id="{{ $container->id }}{{ $container->favorite ? '_remove' : '_add' }}"
                                class="favorite"><i
                                    class="{{ $container->favorite ? 'fa-solid' : 'fa-regular' }} fa-heart"></i></button>
                        </form>
                    </div>
                    <img src="{{ $container->image }}" alt="">
                </div>
            @endforeach
        </div>
    </section>

    <section class="main__difficult">
        <h2>Niveau difficile</h2>
        <div class="main__difficult__manager">
            @foreach ($hard as $container)
                <div class="main__difficult__manager__container">
                    <div class="main__difficult__manager__container__button">
                        <button id="{{ $container->id }}" class="play">Jouer</button>
                        <form onsubmit="return false" class="form{{ $container->id }}">
                            @csrf
                            <button id="{{ $container->id }}{{ $container->favorite ? '_remove' : '_add' }}"
                                class="favorite"><i
                                    class="{{ $container->favorite ? 'fa-solid' : 'fa-regular' }} fa-heart"></i></button>
                        </form>
                    </div>
                    <img src="{{ $container->image }}" alt="">
                </div>
            @endforeach
        </div>
    </section>
    <script src="{{ asset('assets/js/quiz/template.js') }}"></script>
</x-base>
