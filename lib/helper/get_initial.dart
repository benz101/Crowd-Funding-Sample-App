String getInitials(String param) => param.isNotEmpty
    ? param.trim().split(RegExp(' +')).map((s) => s[0]).take(2).join()
    : '';