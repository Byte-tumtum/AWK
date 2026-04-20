#!/bin/sh

# You will implement this exercise with a shell script that contains some awk commands.
# In subsequent exercises, the solution file will contains only awk code.
#
# You have 4 tasks to solve.
# Replace the `{exit}` action with awk code to solve the task.

## task 1
awk 'BEGIN {FS=":"} {print $1}' ./passwd

## task 2
awk '{print NR}' ./passwd

## task 3

awk '
    # The function definition (stays outside the main loop)
    function startsWith(text, prefix) {
        return text ~ "^"prefix
    }
    {
    FS=":"
    ((NR==1) && (FS=":") && ($0=$0)); 
      if (!startsWith($6, "/home") && !startsWith($6, "/root")) {print $0}
    }
' ./passwd

## task 4
awk '
    function startsWith(text, prefix) {
        return text ~ "^"prefix
    }

    {
      FS=":"
      $0=$0;
      if ((startsWith($6, "/home") || startsWith($6, "/root")) && startsWith($7, "/bin/bash")) {print $0}
    }
' ./passwd
