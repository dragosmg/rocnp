# extract_sex() complains when the input is not a `cnp` object

    Code
      extract_sex(1:5)
    Condition
      Error in `extract_sex()`:
      ! `x` must be a `cnp` vector. You have supplied a a string.

---

    Code
      extract_sex(letters)
    Condition
      Error in `extract_sex()`:
      ! `x` must be a `cnp` vector. You have supplied a a string.

---

    Code
      extract_sex(c(TRUE, FALSE, FALSE))
    Condition
      Error in `extract_sex()`:
      ! `x` must be a `cnp` vector. You have supplied a a string.

