run.sh = '
#!/bin/sh

R --slave -f main_script.R 2>&1 | tee output.txt &
'
