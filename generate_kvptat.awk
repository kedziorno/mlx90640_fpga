BEGIN {
	n = 252;

	col1 = 0;
	col2 = 0;
	col3 = 0;
	col4 = 0;
	col5 = 0;
	col6 = 0.0;

	for (col1 = 0; col1 < n; col1 = col1 + 1) {
		col2 = ( col1 * 0xff );
		col3 = ( col2 / ( 2 ^ 10 ) );
		if (col3 > 31) { col4 = col3 - 64 } else { col4 = col3 };
		col5 = ( col4 / ( 2 ^ 12 ) );
		col6 = col5;
		printf("%d,%d,%d,%d,%f,%x\n", col1, col2, col3, col4, col5, col6);
	};
	
	exit;
};

END {
	printf("%s\n", "END");
};

