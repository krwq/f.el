(ert-deftest f-exists?-test/directory-does-exist ()
  (with-sandbox
   (f-mkdir "foo")
   (should (f-exists? "foo"))))

(ert-deftest f-exists?-test/file-does-exist ()
  (with-sandbox
   (f-write "foo.txt")
   (should (f-exists? "foo.txt"))))

(ert-deftest f-exists?-test/does-not-exists ()
  (with-sandbox
   (should-not (f-exists? "foo.txt"))))

(ert-deftest f-directory?-test/is-directory ()
  (with-sandbox
   (f-mkdir "foo")
   (should (f-directory? "foo"))))

(ert-deftest f-directory?-test/is-file ()
  (with-sandbox
   (f-write "foo.txt")
   (should-not (f-directory? "foo.txt"))))

(ert-deftest f-file?-test/is-file ()
  (with-sandbox
   (f-write "foo.txt")
   (should (f-file? "foo.txt"))))

(ert-deftest f-file?-test/is-directory ()
  (with-sandbox
   (f-mkdir "foo")
   (should-not (f-file? "foo"))))

(ert-deftest f-symlink?-test/is-symlink ()
  (with-sandbox
   (f-write "foo.txt")
   (f-symlink "foo.txt" "foo.link")
   (should (f-symlink? "foo.link"))))

(ert-deftest f-symlink?-test/is-not-symlink ()
  (with-sandbox
   (f-write "foo.txt")
   (should-not (f-symlink? "foo.txt"))))
