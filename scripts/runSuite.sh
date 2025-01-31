#!/bin/bash

if [ "$#" -ne 2 ]; then
	echo error: invalid arguments >&2
	exit 4
fi

suite="$1"
file="$2"

for stem in $(cat "$suite"); do
	input="$stem".in
	expected_output="$stem".expect
	args="$stem".args

	if [ ! -r "$expected_output" ]; then
        	echo error: no expect file >&2
        	exit 5
    	fi

	TEMPFILE=$(mktemp)

	cmd="$file"

    	if [ -r "$args" ]; then
        	cmd="$cmd $(cat "$args")"
    	fi

    	if [ -r "$input" ]; then
        	$cmd < "$input" > "$TEMPFILE"
    	else
        	$cmd > "$TEMPFILE"
    	fi

	diff "$TEMPFILE" "$expected_output" > /dev/null

    if [ $? -ne 0 ]; then
        
	echo "Test failed: $stem"

        echo "Args:"
        if [ -r "$args" ]; then
	       	cat "$args";
       	fi

        echo "Input:"
        if [ -r "$input" ]; then
	       	cat "$input";
       	fi

        echo "Expected:"
        cat "$expected_output"

        echo "Actual:"
        cat "$TEMPFILE"
    fi

    rm "$TEMPFILE"

done

exit 0

