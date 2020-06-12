  $ . "$TESTDIR/helper.sh"

Mkrc should not run pre-up and post-up hooks by default

  $ mkdir -p .dotfiles/hooks
  > touch .dotfiles/hooks/pre-up .dotfiles/hooks/post-up
  > chmod +x .dotfiles/hooks/pre-up .dotfiles/hooks/post-up

  $ echo 'echo "hooks ran" > /tmp/test' > .dotfiles/hooks/pre-up
  > echo 'cat /tmp/test; rm /tmp/test' > .dotfiles/hooks/post-up

  $ touch .example1

  $ mkrc .example1

Mkrc -k should run pre-up and post-up hooks
  $ touch .example2

  $ mkrc -k .example2
  hooks ran

Mkrc -K should not run pre-up and post-up hooks
  $ touch .example3

  $ mkrc -K .example3
