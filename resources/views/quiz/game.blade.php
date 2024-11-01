<x-base css="quiz/game.css">
    <div class="h1Img__Contain">
        <h1></h1>
        <img src="}" alt="Image du Quiz">
    </div>
    <div class="responses__Contain">
        <button id="" class="responses__Contain__response response1"></button>
        <button id="" class="responses__Contain__response response2"></button>
        <button id="" class="responses__Contain__response response3"></button>
        <button id="" class="responses__Contain__response response4"></button>
    </div>

    <div class="main__nextQuestion">
        <h2>Question suivante</h2>
    </div>

    <input type="hidden" value="{{ csrf_token() }}" name="_token" class="crsfToken">
    <script src="{{ asset('assets/js/quiz/game.js') }}"></script>
</x-base>
