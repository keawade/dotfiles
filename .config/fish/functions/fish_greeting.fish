function fish_greeting
  # Clear output from shell `login`. `.hushlogin` works too but needs to be in the directory being opened to work and this works everywhere.    
  # Piping to /dev/null because I've aliased `clear` to print some fun text and this gets rid of it in this instance
  clear > /dev/null
  echo Welcome to fish, the friendly interactive shell 🐟
end

