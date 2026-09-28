function scr_wrap_text(_str, _max_width) {
    var result = "";
    var line = "";
    var word = "";
    var len = string_length(_str);
    
    for (var i = 1; i <= len; i++) {
        var ch = string_char_at(_str, i);
        if (ch == " " || i == len) {
            if (i == len && ch != " ") word += ch;
            var test_line = (line == "") ? word : line + " " + word;
            if (string_width(test_line) > _max_width && line != "") {
                result += line + "#";
                line = word;
            } else {
                line = test_line;
            }
            word = "";
        } else {
            word += ch;
        }
    }
    result += line;
    return result;
}