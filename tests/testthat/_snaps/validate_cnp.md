# validate_nchar() errors when CNP is not exactly 13 characters

    Code
      validate_nchar(new_cnp("49804232603223"))
    Condition
      Error:
      ! Each element of `x` must have exactly 13 characters.

---

    Code
      validate_nchar(new_cnp("620120601807"))
    Condition
      Error:
      ! Each element of `x` must have exactly 13 characters.

# validate_sex() errors when the first digit is 0 or 9

    Code
      validate_sex(new_cnp("0940616346114"))
    Condition
      Error:
      ! The sex at birth field -s- must be between 1 and 8.

---

    Code
      validate_sex(new_cnp("9041218318525"))
    Condition
      Error:
      ! The sex at birth field -s- must be between 1 and 8.

# validate_month() errors

    Code
      validate_month(new_cnp("1941316346114"))
    Condition
      Error:
      ! The month of birth field -ll- must be between '01' and '12'.

---

    Code
      validate_month(new_cnp("7042218318525"))
    Condition
      Error:
      ! The month of birth field -ll- must be between '01' and '12'.

# validate_day() complains correctly

    Code
      validate_day(new_cnp("1940631346114"))
    Condition
      Error:
      ! The day of birth field -zz- cannot exceed the number of days in that calendar month.

---

    Code
      validate_day(new_cnp("7041232318525"))
    Condition
      Error:
      ! The day of birth field -zz- cannot exceed the number of days in that calendar month.

---

    Code
      validate_day(new_cnp("197022946114"))
    Condition
      Error:
      ! The day of birth field -zz- cannot exceed the number of days in that calendar month.

---

    Code
      validate_day(new_cnp("7040230318525"))
    Condition
      Error:
      ! The day of birth field -zz- cannot exceed the number of days in that calendar month.

# validate_checksum() identifies invalid CNPs

    Code
      validate_checksum(cnp)
    Condition
      Error:
      ! At least one value failed the checksum test.

