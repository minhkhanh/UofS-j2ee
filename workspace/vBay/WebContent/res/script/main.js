function trimRight(path, delim) {
	var pos = path.indexOf(delim);
	if (pos != -1) {
		alert(path.substring(0, pos + delim.length));
		return path.substring(0, pos + delim.length);
	}

	return path;
}