# new_cnp() complains when input is not character

    Code
      new_cnp(1:2)
    Condition
      Error:
      ! `x` must be a character. You have supplied a a string.

# cnp() complains when the input does not have exactly 13 chars

    Code
      cnp(c("1940616346114", "70412183185253"))
    Condition
      Error in `cnp()`:
      ! Each element of `x` must have exactly 13 characters.

