$(document).ready(function() {
    $(".quiz-entry .glyph-name.concealed").click(function() {
        $(this).addClass("hidden");
        $(this).siblings(".revealed").removeClass("hidden");
    });

    $("#randomize").click(function() {
        $(".quiz-entry .glyph-name.concealed").removeClass("hidden");
        $(".quiz-entry .glyph-name.revealed").removeClass("hidden").addClass("hidden");
        var entries = $(".quiz-entry");
        var index = Math.floor(Math.random() * entries.length);
        console.log("Randomize to: " + $(entries[index]).attr("id"));
        entries[index].scrollIntoView({
            behavior: 'smooth',
            block: 'center'
        });
    });
});
