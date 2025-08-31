# rocnp (development version)

* A complete overhaul of the package and its functionality:
  * A new S3 class called `cnp`.
  * `decompose_cnp()` is no longer exported. 

# rocnp 0.1.0

* The main functions:
    * `check_cnp_is_valid()` checks whether the components of the CNP and the checksum are valid.
    * `decompose_cnp()` splits the CNP into its components (a named vector)
    * `get_` family of functions extracts a single component.
* Added a `NEWS.md` file to track changes to the package.
