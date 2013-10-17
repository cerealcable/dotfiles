#!/bin/bash
#
# Update Debian alternatives for Java.


function updateJava {
	DIR=$1

	if [ -x "$DIR/bin/java" ]
	then
		VERSION=$("$DIR/bin/java" -version 2>&1 | awk -F '"' '/version/ {print $2}')
		WEIGHT=${VERSION//[_.]/}

		echo "Updating Java from $DIR with Version $VERSION and Weight $WEIGHT"
	else
		return
	fi

	SLAVES=""
	if [ -f "$DIR/bin/appletviewer" ]
	then
		SLAVES="$SLAVES --slave /usr/bin/appletviewer appletviewer $DIR/bin/appletviewer"
	fi

	if [ -f "$DIR/bin/apt" ]
	then
		SLAVES="$SLAVES --slave /usr/bin/apt apt $DIR/bin/apt"
	fi

	if [ -f "$DIR/bin/extcheck" ]
	then
		SLAVES="$SLAVES --slave /usr/bin/extcheck extcheck $DIR/bin/extcheck"
	fi

	if [ -f "$DIR/bin/idlj" ]
	then
		SLAVES="$SLAVES --slave /usr/bin/idlj idlj $DIR/bin/idlj"
	fi

	if [ -f "$DIR/bin/jar" ]
	then
		SLAVES="$SLAVES --slave /usr/bin/jar jar $DIR/bin/jar"
	fi

	if [ -f "$DIR/bin/jarsigner" ]
	then
		SLAVES="$SLAVES --slave /usr/bin/jarsigner jarsigner $DIR/bin/jarsigner"
	fi

	if [ -f "$DIR/bin/javac" ]
	then
		SLAVES="$SLAVES --slave /usr/bin/javac javac $DIR/bin/javac"
	fi

	if [ -f "$DIR/bin/javadoc" ]
	then
		SLAVES="$SLAVES --slave /usr/bin/javadoc javadoc $DIR/bin/javadoc"
	fi

	if [ -f "$DIR/bin/javah" ]
	then
		SLAVES="$SLAVES --slave /usr/bin/javah javah $DIR/bin/javah"
	fi

	if [ -f "$DIR/bin/javap" ]
	then
		SLAVES="$SLAVES --slave /usr/bin/javap javap $DIR/bin/javap"
	fi

	if [ -f "$DIR/bin/jconsole" ]
	then
		SLAVES="$SLAVES --slave /usr/bin/jconsole jconsole $DIR/bin/jconsole"
	fi

	if [ -f "$DIR/bin/jdb" ]
	then
		SLAVES="$SLAVES --slave /usr/bin/jdb jdb $DIR/bin/jdb"
	fi

	if [ -f "$DIR/bin/jhat" ]
	then
		SLAVES="$SLAVES --slave /usr/bin/jhat jhat $DIR/bin/jhat"
	fi

	if [ -f "$DIR/bin/jinfo" ]
	then
		SLAVES="$SLAVES --slave /usr/bin/jinfo jinfo $DIR/bin/jinfo"
	fi

	if [ -f "$DIR/bin/jmap" ]
	then
		SLAVES="$SLAVES --slave /usr/bin/jmap jmap $DIR/bin/jmap"
	fi

	if [ -f "$DIR/bin/jps" ]
	then
		SLAVES="$SLAVES --slave /usr/bin/jps jps $DIR/bin/jps"
	fi

	if [ -f "$DIR/bin/jrunscript" ]
	then
		SLAVES="$SLAVES --slave /usr/bin/jrunscript jrunscript $DIR/bin/jrunscript"
	fi

	if [ -f "$DIR/bin/jsadebugd" ]
	then
		SLAVES="$SLAVES --slave /usr/bin/jsadebugd jsadebugd $DIR/bin/jsadebugd"
	fi

	if [ -f "$DIR/bin/jstack" ]
	then
		SLAVES="$SLAVES --slave /usr/bin/jstack jstack $DIR/bin/jstack"
	fi

	if [ -f "$DIR/bin/jstat" ]
	then
		SLAVES="$SLAVES --slave /usr/bin/jstat jstat $DIR/bin/jstat"
	fi

	if [ -f "$DIR/bin/jstatd" ]
	then
		SLAVES="$SLAVES --slave /usr/bin/jstatd jstatd $DIR/bin/jstatd"
	fi

	if [ -f "$DIR/bin/native2ascii" ]
	then
		SLAVES="$SLAVES --slave /usr/bin/native2ascii native2ascii $DIR/bin/native2ascii"
	fi

	if [ -f "$DIR/bin/rmic" ]
	then
		SLAVES="$SLAVES --slave /usr/bin/rmic rmic $DIR/bin/rmic"
	fi

	if [ -f "$DIR/bin/schemagen" ]
	then
		SLAVES="$SLAVES --slave /usr/bin/schemagen schemagen $DIR/bin/schemagen"
	fi

	if [ -f "$DIR/bin/serialver" ]
	then
		SLAVES="$SLAVES --slave /usr/bin/serialver serialver $DIR/bin/serialver"
	fi

	if [ -f "$DIR/bin/wsgen" ]
	then
		SLAVES="$SLAVES --slave /usr/bin/wsgen wsgen $DIR/bin/wsgen"
	fi

	if [ -f "$DIR/bin/wsimport" ]
	then
		SLAVES="$SLAVES --slave /usr/bin/wsimport wsimport $DIR/bin/wsimport"
	fi

	if [ -f "$DIR/bin/xjc" ]
	then
		SLAVES="$SLAVES --slave /usr/bin/xjc xjc $DIR/bin/xjc"
	fi

	if [ -f "$DIR/lib/amd64/libnpjp2.so" ]
	then
		SLAVES="$SLAVES --slave /usr/lib/firefox/plugins/libjavaplugin.so mozilla-javaplugin.so $DIR/lib/amd64/libnpjp2.so"
		SLAVES="$SLAVES --slave /opt/google/chrome/plugins/libjavaplugin.so chrome-javaplugin.so $DIR/lib/amd64/libnpjp2.so"
	fi

	if [ -f "$DIR/jre/lib/amd64/libnpjp2.so" ]
	then
		SLAVES="$SLAVES --slave /usr/lib/firefox/plugins/libjavaplugin.so mozilla-javaplugin.so $DIR/jre/lib/amd64/libnpjp2.so"
		SLAVES="$SLAVES --slave /opt/google/chrome/plugins/libjavaplugin.so chrome-javaplugin.so $DIR/jre/lib/amd64/libnpjp2.so"
	fi

	if [ -f "$DIR/lib/i386/libnpjp2.so" ]
	then
		SLAVES="$SLAVES --slave /usr/lib/firefox/plugins/libjavaplugin.so mozilla-javaplugin.so $DIR/lib/i386/libnpjp2.so"
		SLAVES="$SLAVES --slave /opt/google/chrome/plugins/libjavaplugin.so chrome-javaplugin.so $DIR/lib/i386/libnpjp2.so"
	fi

	if [ -f "$DIR/jre/lib/i386/libnpjp2.so" ]
	then
		SLAVES="$SLAVES --slave /usr/lib/firefox/plugins/libjavaplugin.so mozilla-javaplugin.so $DIR/jre/lib/i386/libnpjp2.so"
		SLAVES="$SLAVES --slave /opt/google/chrome/plugins/libjavaplugin.so chrome-javaplugin.so $DIR/jre/lib/i386/libnpjp2.so"
	fi

	#echo -e "update-alternatives --install \\"
	#echo -e "\t/usr/bin/java java \\"
	#echo -e "\t$DIR/bin/java $WEIGHT \\"
	#echo -e "\t$SLAVES \\"
	#echo -e "\t&> /dev/null"

	update-alternatives --install \
		/usr/bin/java java \
		$DIR/bin/java $WEIGHT \
		$SLAVES \
		&> /dev/null
}


# Remove all versions of java
`update-alternatives --remove-all java &> /dev/null`

# Make Firefox Plugin Dir
if [ ! -d /usr/lib/firefox/plugins ]
then
	mkdir /usr/lib/firefox/plugins
fi

# Make Google Chrome Plugin Dir
if [ ! -d /opt/google/chrome/plugins ]
then
	mkdir /opt/google/chrome/plugins
fi

# Find and install all versions of java
BASE_DIR="${1%/}"
CONTENTS="$(ls $BASE_DIR)"
for X in $CONTENTS
do
	if [ -d "$BASE_DIR/$X" ]
	then
		updateJava "$BASE_DIR/$X"
	fi
done
