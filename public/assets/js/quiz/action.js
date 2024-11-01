document.querySelector(".main__game .cancel").addEventListener("click", () => {
    if (confirm("Voulez-vous vraiment supprimé la partie ?")) {
        location.replace("/")
        $.ajax({
            type: "POST",
            url: "/quiz/game/destroy",
            data: {
                _token: document.querySelector(".deleteGame").value
            },
            error: function (err) {
                console.log(err);
            }
        });
    }
})