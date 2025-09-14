# parse_yob() works

    Code
      parse_yob(decompose_cnp(valid_cnp))
    Output
      $s
      [1] "1" "7" "4" NA 
      
      $aa
      [1] "94" "04" "98" NA  
      
      $ll
      [1] "06" "12" "04" NA  
      
      $zz
      [1] "16" "18" "23" NA  
      
      $jj
      [1] "34" "31" "26" NA  
      
      $nnn
      [1] "611" "852" "032" NA   
      
      $c
      [1] "4" "5" "2" NA 
      
      $cnp
      [1] "1940616346114" "7041218318525" "4980423260322" NA             
      
      $yob
      [1] "1994" "2004" "1898" NA    
      

# parse_dob() works

    Code
      parse_dob(parse_yob(decompose_cnp(valid_cnp)))
    Output
      $s
      [1] "1" "7" "4" NA 
      
      $aa
      [1] "94" "04" "98" NA  
      
      $ll
      [1] "06" "12" "04" NA  
      
      $zz
      [1] "16" "18" "23" NA  
      
      $jj
      [1] "34" "31" "26" NA  
      
      $nnn
      [1] "611" "852" "032" NA   
      
      $c
      [1] "4" "5" "2" NA 
      
      $cnp
      [1] "1940616346114" "7041218318525" "4980423260322" NA             
      
      $yob
      [1] "1994" "2004" "1898" NA    
      
      $dob
      [1] "1994-06-16" "2004-12-18" "1898-04-23" NA          
      

# parse_county() works

    Code
      parse_county(decompose_cnp(valid_cnp))
    Output
      $s
      [1] "1" "7" "4" NA 
      
      $aa
      [1] "94" "04" "98" NA  
      
      $ll
      [1] "06" "12" "04" NA  
      
      $zz
      [1] "16" "18" "23" NA  
      
      $jj
      [1] "34" "31" "26" NA  
      
      $nnn
      [1] "611" "852" "032" NA   
      
      $c
      [1] "4" "5" "2" NA 
      
      $cnp
      [1] "1940616346114" "7041218318525" "4980423260322" NA             
      
      $county
      [1] "Teleorman" "Sălaj"     "Mureș"     NA         
      

# parse_status() works

    Code
      parse_status(decompose_cnp(valid_cnp))
    Output
      $s
      [1] "1" "7" "4" NA 
      
      $aa
      [1] "94" "04" "98" NA  
      
      $ll
      [1] "06" "12" "04" NA  
      
      $zz
      [1] "16" "18" "23" NA  
      
      $jj
      [1] "34" "31" "26" NA  
      
      $nnn
      [1] "611" "852" "032" NA   
      
      $c
      [1] "4" "5" "2" NA 
      
      $cnp
      [1] "1940616346114" "7041218318525" "4980423260322" NA             
      
      $status
      [1] "native"   "resident" "native"   NA        
      

