static const Block blocks[] = {
	/* Icon */  /* Command */                                                                                /* Update Interval */  /* Update Signal */
	{ "",       "LC_ALL=C top -bn1 | grep 'Cpu(s)' | awk '{print \"💻 \" 100 - $8 \"% |\"}'",                    2,                      0 },
	{ "",       "free -m | awk '/Mem:/ { printf(\"🧠 %d%% |\\n\", $3/$2*100) }'",                                  5,                      0 },
	{ "",       "wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print \"🔊 \" int($2*100)\"% |\"}'",             2,                      10 },
	{ "",       "date +'📅 %a %d %b %H:%M:%S |'",                                                                1,                      0 },
};

static char delim[] = " ";
static unsigned int delimLen = 5;
