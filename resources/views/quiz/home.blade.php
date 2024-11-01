<x-base css="quiz/home.css">
    <section class="main__waiting">
        <h2>En attente de joueurs <span>.</span></h2>
    </section>
    <div class="main__nickname">
        Pseudo: {{ $nickname }}
    </div>
    <input type="hidden" value="{{ csrf_token() }}" class="crsfToken" name="_token">
    <script src="{{ asset('assets/js/quiz/home.js') }}"></script>
</x-base>
