function point() {
    const getH2 = document.querySelector(".main__waiting span")

    setTimeout(() => {
        getH2.innerText = "."
    }, 500)

    setTimeout(() => {
        getH2.innerText = ".."
    }, 1500)

    setTimeout(() => {
        getH2.innerText = "..."
    }, 2000)
}

setInterval(() => {
    point()
}, 2500)

setInterval(() => {
    $.ajax({
        type: "POST",
        url: "/quiz/game/status",
        data: {
            _token: document.querySelector(".crsfToken").value
        },
        success: function (response) {
            if(response?.launch) return location.reload()
        },
        error: function (err) {
            leaveGame()
            return location.reload()
        }
    });
}, 1000)

function leaveGame() {
    $.ajax({
        type: "GET",
        url: "/quiz/game/leave",
        data: document.querySelector(".crsfToken").value,
        error: function (err) {
            console.log(err);
        }
    });
}