import sys
import re

clock_cycles = {'add' : 1, 'sub' : 1, 'mov' : 1, 'ldr' : 1, 'str' : 1, 'mul' : 2, 'and' : 1 , 'bgt' : 1, 'bne' : 1, 'cmp' : 1, 'b' : 1, 'be': 1, 'blt': 1, 'moveq': 1, 'movne' : 1, 'bx' : 1}

if __name__ == "__main__": 
    if len(sys.argv) < 4: 
        print "run as: instruction_counter.py <name of ASM file> <start_line_number> <end_line_number>"
        exit()

    f = open(sys.argv[1])

    try:
        start_line = int(sys.argv[2])
        end_line = int(sys.argv[3])
    except:
        print "run as: instruction_counter.py <name of ASM file> <start_line_number> <end_line_number>"

    lines = []; 

    cycle_count = 0

    i = 1
    for line in f:
        line = line.strip()
        lines.append(line)
        if i <=  end_line and i >= start_line: 
            print str(i)+"\t:\t"+line,  #print out the line being analyzed
            l = re.findall(r"[\w']+", line)
            try:
                if l[0] in clock_cycles.keys():
                    cycle_count += clock_cycles[l[0]]
                    print "\t\tcycles : "+str(clock_cycles[l[0]])
                else: 
                    print "\t\tcycles : NaN, not counted -----------------!"
            except KeyError: 
                print "ERROR: Line "+str(i)+" range contains an instruction that is not in the list of valid instructions("+str(clock_cycles.keys())+")"
                print "ERROR: Please adjust your line numbers"
                exit()
   
        i += 1 #increment the counter

    print "============================="
    print "COMPLETED: "
    print "number of cycles estimated was: "+str(cycle_count)
    print "============================="
    
