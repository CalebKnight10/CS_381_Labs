######################################### 	
#    CS 381 - Programming Lab #1		#
#										#
#  < SOLUTION >							#
#  < your email here>					#
#										#
#########################################
my $name = "Replace with Your Name";

#########################################
##
##  ETHICS Reminder
##
##  Yes: use the internet to learn Raku
##
##  No: don't use other people to do your work
##
#########################################

#########################################
# VARIABLE DEFINITIONS 
#########################################

# pseudo-constants...
# ... the tests override your choice, so
#     you can set your preferred value
my $STOP_WORDS = 0;           # flag - filter stopwords, 0 (off) | 1 (on)
my $DEBUG = 0;				  # flag - debug words, 0 (off) | 1 (on)
my $SEQUENCE_LENGTH = 10;	  # length of song title, suggested default 10
my $FILE = "";

# variable initialization...
# ... you will use all three at some point

# array of song tracks
my @tracks = ();
# hash of hashes for bigram counts
my %counts = ();
# hash of words already used in current sequence, reset for new sequence
my %word_history = ();


#########################################
# Functions that you will edit
#########################################

# This extracts a title from the raw track input line
sub extract_title {
	if ($DEBUG) {say "<extracting titles>\n";}
	my @tracktitles = ();
	
	for @tracks -> $track { 
	
		################
		# LAB 1 TASK 1 #
		################
		## Edit the regex below to capture only song title
		##
		if ($track ~~ /(.*)/) {
		##		
		############################# End Task 1
			
			# $0 should be the title caught by regex first set of parens
			# It is added to end of the array		
			@tracktitles.push: $0;
		}
	} 
	# Updates @tracks
	return @tracktitles;
}

# This removes comments and parenthetical information
sub comments {
	if ($DEBUG) {say "<filtering comments>\n";}
	my @filteredtitles = ();
	
	# This loops through each track
	for @tracks -> $title { 

		##########################
		# LAB 1 TASK 2           #
		##########################
		## Add regex substitutions to remove superflous comments and all that follows them
		## Assign to $_ with smartmatcher (~~)
		########################## 
		$_ = $title;

		# Uncomment and replace ... with a substition for ( and anything that follows
		# $_ ~~ ...

		# Repeat for the other symbols

		########################## End Task 2
		
		# Add the edited $title to the new array of titles
		@filteredtitles.push: $_;
	}
	# Updates @tracks
	return @filteredtitles;
}

# This removes punctutation
sub punctuation {
	if ($DEBUG) {say "<filtering punctuation>\n";}
	my @filteredtitles = ();

	##########################
	# LAB 1 TASK 3           #
	##########################
	## Add regex substitutions to remove punctuation
	## Remember to permit the apostrophe ' (near enter key)
	## Use the g (greedy) directive
	##########################
	
	for @tracks -> $title { 
		##########################
		$_ = $title;
		# Uncomment and replace ... with a substition for ?
		# $_ ~~ ...

		# Repeat for the other symbols

		########################## End Task 3
		# Add the edited $title to the new array of titles
		@filteredtitles.push: $_;
	}
		
	# Updates @tracks	
	return @filteredtitles;			
}


# This removes non-English characters, trailing whitespace, and blank titles
sub clean {
	if ($DEBUG) {say "<filtering non-ASCII characters>\n";}
	my @filteredtitles = ();
	
	##########################
	# TASK 4, 5, 6, 7 Below  #
	##########################
	## These are small tasks, where each "<your code here>"
	##   will be either a regex substitution 
	##   or an if statement and a subsequent action (e.g. skip to next without adding)
	##########################
		
	# This loops through each track
	for @tracks -> $title {
	
		##########################
		# LAB 1 TASK 4           #
		##########################
		## Add regex substitutions to (1) trim leading and trailing whitespace
		##    and then (2) leading and trailing apostrophes. 
		## There will be some trailing apostrophes left after the trailing whitespace is removed
		##########################
	
		# replace leading/trailing apostrophe
		$_ = $title;

		# Uncomment and replace ... with a substition to trim apostrophes
		# $_ ~~ ...    # trim leading apostrophes
		# $_ ~~ ...    # trim trailing apostrophes

		# Uncomment and replace ... with a substition to trim whitespace
		# $_ ~~ ...    # trim leading whitespace
		# $_ ~~ ...    # trim trailing whitespace

		########################## End Task 4

	
		##########################
		# LAB 1 TASK 5           #
		##########################
		## Filter out non-ASCII characters 
		## (letters, numbers, apostophe, space allowed)
		##########################

		# Use "next;" to skip lines containing non-ASCII characters
		##########################
		##                      ##
		## <Insert code here>   ##
		##                      ##
		##########################
		
		########################## End Task 5
	
		
	
		##########################
		# LAB 1 TASK 6           #
		##########################
		## Skip title if (1) blank contains only whitespace, 
		## or (2) contains only apostrophes
		##########################

		# skip if only contains whitespace
		##########################
		##                      ##
		## <Insert code here>   ##
		##                      ##
		##########################


		# skip if only contains only an apostrophe
		##########################
		##                      ##
		## <Insert code here>   ##
		##                      ##
		##########################
	
		########################## End Task 6
	

		##########################
		# LAB 1 TASK 7           #
		##########################
		## Set to lowercase 
		##########################		
		# minor edit needed to this line (raku has a handy function)
		@filteredtitles.push: $_;
		########################## End Task 7
		
	}
	# Updates @tracks	
	return @filteredtitles;			
}
	
# This removes common stopwords	
sub stopwords {
	if ($DEBUG) {say "<filtering stopwords>\n";}
	my @filteredtitles = ();

	##########################
	# LAB 1 TASK 8 #
	##########################
	## Add regex substitutions to remove common stopwords
	## Use <|w> (word boundaries) in your regexs
	## Also trim the single space following the word
	## Use the g (greedy) directive
	## Use the i (case insensitive) directive
	##########################
	for @tracks -> $title { 

		##########################
		$_ = $title;

		# Uncomment and replace ... with a substition for "a"
		# $_ ~~ ...

		# Repeat for the other stopwords

		##########################
		# Add the edited $title to the new array of titles
		@filteredtitles.push: $_;
	}
	
	########################## End Task 8
	
	# Updates @tracks	
	return @filteredtitles;			
}


# This splits the tracks into words and builds the bi-gram model
sub build_bigrams {

	##########################
	# LAB 2 TASK 1: Bigram Counts
	##########################
	## Loop through the tracks to split the titles into words. 
	## Count all adjacent pairs.
	##
	## Following your diligent work, the %counts hash (declared up yonder) 
	## should contain the bigram counts for all consecutive word pairs across
	## the entire dataset of tracks
	##
	## Plan carefully.  It is not a lot of code.
	##
	## My approach is ~10 lines (4 of which are just a closing curly-brace) 
	##    (the take away is that it does not take much; 
	##     there is no need to take exactly 10 lines)
	##########################
	
	
	##########################
	##                      ## 
	## <Insert code here>   ##
	##                      ##   
	##########################


	########################## End Task Bigram Counts
	
	if ($DEBUG) {say "<bigram model built>\n";}	
}


# This finds the most-common-word (mcw) to follow the given word
sub mcw {
	# Seed word (arg) for which we find the next word
	my $word = @_[0];
	# Store the most common next word in this variable and return it.
	my $best_word = '';
	
	##########################
	# LAB 2 TASK 2: MCW
	##########################
	##
	## Find all available "next" words for $word
	## Sort them (there is a function for that)
	##   so your results are deterministic and match the tests
	##
	## Iterate through all the available words
	##   that follow $word in the %counts
	##
	## Remember to check the %word_history	
	##   and skip that word if used before
	##
	## Find the candidate word with highest count,
	##   update $best_word (it gets returned)
    ## 
	## In case of ties, stick with first one found
	##    (i.e. use strictly > in your count comparison if)
	##    that way you make the same choice the tests do
	##
	## This comment is longer than your code will be for this task. 
	##########################
	
	
	##########################
	##                      ## 
	## <Insert code here>   ##
	##                      ##   
	##########################


	########################## End Task MCW
	

	if ($DEBUG) {say "  <mcw for \'$word\' is \'$best_word'\>\n";}
	
	# return the most common word to follow word
	return $best_word
}



# This builds a song title based on mcw
sub sequence {
	if ($DEBUG) {say "<sequence for \'$_[0]\'>\n";}	
	
	# clear word history for new sequence
	%word_history = ();
		
	##########################
	# LAB 2 TASK 3: Build Song Title
	##########################
	## Use the seed word to build a sequence.
	## For each word, look up the mcw
	## Add to sequence.
	## Repeat until next word is empty or newline
	## Mind the max $SEQUENCE_LENGTH
	## Remember to track word history using %word_history
	## My solution is about 12 lines (and could have been less)
	##########################
	
	
	##########################
	##                      ## 
	## <Insert code here>   ##
	##                      ##   
	##########################


		
	# return the sequence you created instead of this measely string
	return "ERROR: SEQUENCE 404";
	########################## End Task Song Title
}

##############################################################################
##             End Functions that students edit                              #
##############################################################################

##############################
##                           #
##     READ ONLY BELOW       #
##                           #
##############################

##############################
##############################
##############################
##                           #
##     Menu System           #
##                           # 
##############################
##                           # 
##  Read and understand      #
##   how to use the commands #
##                           # 
##  You do not need to edit  # 
##    the menu code below.   # 
##                           # 
##  You may expand the menu  # 
##   to you add your own     #
##   commands, if desired.   # 
##  				         # 
##  Do not break any of the  # 
##   existing command rules  # 
##   or you will fail tests. # 
##                           # 
##############################

# This is the "command" loop that runs until end-of-input
for lines() {    
	
	# split line into array of words
	my @input = split(/\s+/, $_);	
	# command is @input[0], first word
    my $command = lc(@input[0]);
	# argument is @input[1], second word
	
	if ($command eq "load") { 
		# load the input file
		my $file = lc(@input[1]);
		$FILE = $file;				
		load($file);	
	}elsif ($command eq "length") { 	
		# change the sequence length
		if ($DEBUG) {say "<sequence length " ~ @input[1] ~ ">\n";}
		$SEQUENCE_LENGTH = @input[1];
	}elsif ($command eq "debug") { 
		# toggle debug mode on/off
		if (lc(@input[1]) eq "on") {
			if ($DEBUG) {say "<debug on>\n";}
			$DEBUG = 1;
		}elsif (lc(@input[1]) eq "off") {
			if ($DEBUG) {say "<debug off>\n";}
			$DEBUG = 0;
		}else {
			say "**Unrecognized argument to debug: " ~ @input[1] ~ "\n";
		}
	}elsif ($command eq "count") { 
		if (lc(@input[1]) eq "tracks") {
			# count the number of lines in @tracks			
			count_lines(@tracks);
		}elsif (lc(@input[1]) eq "words") {
			# count the number of words in @tracks
			count_words(@tracks);
		}elsif (lc(@input[1]) eq "characters") {
			# count the number of characters in @tracks
			count_characters(@tracks);
		}else {
			say "**Unrecognized argument: " ~ @input[1] ~ "\n";
		}
	}elsif ($command eq "stopwords") { 
		# toggle stopwords on/off
		if (lc(@input[1]) eq "on") {
			if ($DEBUG) {say "<stopwords on>\n";}
			$STOP_WORDS = 1;
		}elsif (lc(@input[1]) eq "off") {
			if ($DEBUG) {say "<stopwords off>\n";}
			$STOP_WORDS = 0;
		}else {
			say "**Unrecognized argument: " ~ @input[1] ~ "\n";
		}
	}elsif ($command eq "filter") { 
		if (@input[1] eq "title") {		
			# extract the title from the line
			@tracks = extract_title();
		}elsif (@input[1] eq "comments") {
			# filter out extra phrases from the titles
			@tracks = comments();
		}elsif (@input[1] eq "punctuation") {
			# filter out punctuation		
			@tracks = punctuation();
		}elsif (@input[1] eq "unicode") {
			# filter out non-ASCII characters		
			@tracks = clean();
		}elsif (@input[1] eq "stopwords" && $STOP_WORDS) {	
			# filter out common words, if enabled
			@tracks = stopwords();		
		}else {
			say "**Unrecognized argument to stopwords: " ~ @input[1] ~ "\n";
		}	
	}elsif ($command eq "preprocess") { 
		# preprocess does all of the filtering tasks at once and builds bigrams
		
		# first, extract the title from the line
		@tracks = extract_title();
		# next, filter out extra phrases from the titles
		@tracks = comments();
		# next, filter out punctuation
		@tracks = punctuation();
		# next, filter out non-ASCII characters, blank titles
		@tracks = clean();		
		# next, filter out common words, if enabled
		if ($STOP_WORDS) {@tracks = stopwords();}
		
		# build bi-gram model counting occurences of word pairs
		build_bigrams();
	}elsif ($command eq "build") {
		# build bi-gram model counting occurences of word pairs
		build_bigrams();
	}elsif ($command eq "mcw") {
		# say the most-common-word to follow given word
		say mcw(lc(@input[1]));
	}elsif ($command eq "sequence") { 
		# say a song title based on the given word
		say sequence(lc(@input[1])).Str;
	}elsif ($command eq "print") {
		if (@input[1]) {
			say_some_tracks(val(@input[1]));
		}else {
			say_all_tracks(@tracks);
		}
	}elsif ($command eq "author") { 
		say "Lab1 by $name run";		
	}elsif ($command eq "name") { 
		say sequence(lc($name));               
	}elsif ($command eq "random") { 
		say sequence((%counts.keys)[%counts.keys.rand]).Str;			
	}else {
		# warn user if command was ignored
		say "**Unrecognized command: " ~ $command;
	}	
}


##############################
##############################
##############################
##                           #
##     Helper Functions      #
##                           # 
##############################
##                           # 
## Below contains important  # 
## functions the menu uses.  # 
##                           # 
##                           #
## Feel free to look around. #
##                           # 
## Help yourself to the      #
##     cookies and punch.    #
##                           #
## Look but don't touch.     #
##                           #
## You break it,             #
##         you bought it!    # 
##############################

# This loops through N lines of the array 
sub say_some_tracks($n) {
	if ($DEBUG) {say "<printing $n tracks>\n";}	
	loop (my $i=0; $i < $n; $i++) {
		say @tracks[$i];
	} 
}

# This loops through each line of the array
sub say_all_tracks {	
	if ($DEBUG) {say "<saying all tracks>\n";}	
	# are you sure you want to? (use CTRL+C to kill it)
	my $fh = open "tracks.out", :w;
	for (@_) { 
		$fh.say($_);
	} 
	$fh.close;
}

# Count lines of array
sub count_lines {
	if ($DEBUG) {say "<counting number of tracks>\n";}
	say @_.elems;
}

# Count words, after splitting on whitespace
sub count_words {
	if ($DEBUG) {say "<counting number of words>\n";}
	my $word_count = @_.words;
	say $word_count.elems;
}

# Count individual characters
sub count_characters {
	if ($DEBUG) {say "<counting number of characters>\n";}
	say @_.chars;
}

# Loads the tracks file into an array
sub load {
	for @_.IO.lines -> $line {
		@tracks.push($line); 
	}
	if ($DEBUG) {say "<loaded " ~ $FILE ~ ">"};	
}