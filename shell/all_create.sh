for d in $(find . -depth 1 -type d); do
    count=$(ls $d -l | wc -l | tr -d ' ') 
    apngasm -o $d.png $d/*.png -d$((2000/($count-1))) -l1
done
