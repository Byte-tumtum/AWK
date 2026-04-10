# Cool exercise

BEGIN {
    # define the field separator
    FS=","
}

{
    # generate and print the output for each record
    a = $3 $4; 
    b = $5 $6;
    print "#"$1 ", " $2 " = " ((a + b) / 2)
}
