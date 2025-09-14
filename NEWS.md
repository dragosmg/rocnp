# rocnp (development version)

* A complete overhaul of the package and its functionality:
  * A new S3 class called `cnp`.
  * `decompose_cnp()` is no longer exported. 
  * `cnp()` is the main constructor
  * `is_cnp()` can be used to check if an object is of class `cnp`.
  * the `extract_()` family of functions can be used to extract the various components:
    * `extract_sex()` extracts the sex.
    * `extract_birth_year()` extracts the year of birth.
    * `extract_birth_month()` extracts the month of birth.
    * `extract_county()` gets the county of issue.
    * `extract_status()` extracts the residence status.
    * `extract_dob()` gets the date of birth.
* Added a pkgdown website.

# rocnp 0.1.0

* The main functions:
    * `check_cnp_is_valid()` checks whether the components of the CNP and the checksum are valid.
    * `decompose_cnp()` splits the CNP into its components (a named vector)
    * `get_` family of functions extracts a single component.
* Added a `NEWS.md` file to track changes to the package.
