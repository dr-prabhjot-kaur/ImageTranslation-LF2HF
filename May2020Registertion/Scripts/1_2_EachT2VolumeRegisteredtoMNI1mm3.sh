#!/bin/bash


for (( i = 1 ; i <= 3; i++ )) ### Inner for loop ###
do
	for ((j=1; j<=3; j++))
	do
		inputt=$j     #total=$(( $i + $j))   # total 
		inputt+="0000"
		inputt+=$i
		echo $inputt

		unset refs
		refvol="MNI152_T1_1mm_brain.nii.gz"
		echo "Registering the volume $inputt to MNI tempelate skull brain $refvol"
		invol="/home/gpu/Data/Prabhjot/LowLowerLowest/May2020Registertion/$inputt"
		invol+="/T2w_acpc_dc_restore_brain.nii.gz"

		outvol="/home/gpu/Data/Prabhjot/LowLowerLowest/May2020Registertion/$inputt"
		outvol+="/T2w_acpc_dc_restore_1mm_brain_FLIRT_MNI152_T1_1mm_brain.nii.gz"

		echo $invol
		echo ""
		echo $outvol
		echo $refvol

		flirt -in $invol -ref $refvol -out $outvol

	done

done
echo "" #### print the new line ###




#foo="Hello"
#foo="$foo World"
#echo $foo
#if [ $tmp -eq 0 ]; 
        #then
            #echo -e -n "\033[47m  "
        #else
            #echo -e -n "\033[40m  "
        #fi
	





#flirt -in /home/gpu/projects/Pipelines_ExampleData/100001/T1w/T1w_acpc_dc_restore_brain.nii.gz -ref /usr/local/fsl/data/standard/MNI152lin_T1_1mm_brain.nii.gz -out Reg1mm.nii.gz -omat transReg.mat -dof 12 

