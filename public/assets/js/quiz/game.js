$(document).ready(function () {
    function updateQuiz(request) {
        document.querySelector(".h1Img__Contain h1").innerText = request.question
        document.querySelector(".h1Img__Contain img").src = request.image
        document.querySelectorAll(".responses__Contain__response").forEach((container, index) => {
            container.id = request.responses[index].response_id
            container.innerText = request.responses[index].response_value
        })
    }
    $.ajax({
        type: "POST",
        url: "/quiz/game/status",
        data: {
            _token: document.querySelector(".crsfToken").value
        },
        success: function (response) {
            console.log(response, "JE SUIS LA REPONSE");
            updateQuiz(response)
        },
        error: function (err) {
            console.log(err, "ERREUR");
        }
    });

    setInterval(() => {
        $.ajax({
            type: "POST",
            url: "/quiz/game/status",
            data: {
                _token: document.querySelector(".crsfToken").value
            },
            success: function (response) {
                if (response?.end) return location.reload()
                if (response?.next) {
                    document.querySelector(".main__nextQuestion").classList.add("active")
                    updateQuiz(response)
                    for (let i = 0; i < document.querySelectorAll(".responses__Contain__response").length; i++) {
                        let button = document.querySelectorAll(".responses__Contain__response")[i]
                        button.disabled = false
                    }
                    setTimeout(() => {
                        document.querySelector(".main__nextQuestion").classList.remove("active")
                    }, 3000)
                }
            },
            error: function (err) {
                console.log(err, "ERREUR");
            }
        });
    }, 1000)

    document.querySelectorAll(".responses__Contain__response").forEach(container => {
        container.addEventListener("click", () => {
            $.ajax({
                type: "POST",
                url: "/quiz/game/response",
                data: {
                    _token: document.querySelector(".crsfToken").value,
                    responseId: container.id
                },
                success: function (response) {
                    for (let i = 0; i < document.querySelectorAll(".responses__Contain__response").length; i++) {
                        let button = document.querySelectorAll(".responses__Contain__response")[i];
                        if (button.id !== container.id) button.disabled = true;

                    }
                },
                error: function (err) {
                    console.log(err);
                }
            });
        })
    })
});