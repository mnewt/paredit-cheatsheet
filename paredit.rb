cheatsheet do
  title 'Paredit'
  docset_file_name 'paredit_cheatsheet'
  keyword 'paredit'
  source_url 'https://github.com/mnewt/paredit_cheatsheet'

  category do
    id 'Basic Insertion Commands'

    entry do
      command '('
      command 'paredit-open-round'
      td_notes <<-'END' 
        ```clojure
        (a b |c d)
        (a b (|) c d)
        ```
      END
      td_notes <<-'END'
        ```clojure
        (foo "bar |baz" quux)
        (foo "bar (|baz" quux)
        ```
      END
    end

    entry do
      command ')'
      command 'paredit-close-round'
      td_notes <<-'END' 
        ```clojure
        (a b |c )
        (a b c)|
        ```
      END
      td_notes <<-'END'
        ```clojure
        ; Hello,| world
        ; Hello,)| world
        ```
      END
    end

    entry do
      command 'M-)'
      command 'paredit-close-round-and-newline'
      td_notes <<-'END' 
        ```clojure
        (defun f (x| ))
        (defun f (x| )
        )        
        ```
      END
      td_notes <<-'END'
        ```clojure
        ; (Foo.|
        ; (Foo.|        
        ```
      END
    end

    entry do
      command '['
      command 'paredit-open-square'
      td_notes <<-'END' 
        ```clojure
        (a b |c d)
        (a b [|] c d)
        ```
      END
      td_notes <<-'END'
        ```clojure
        (foo "bar |baz" quux)
        (foo "bar [|baz" quux)
        ```
      END
    end

    entry do
      command ']'
      command 'paredit-close-round'
      td_notes <<-'END' 
        ```clojure
        (define-key keymap [frob| ] \'frobnicate)
        (define-key keymap [frob]| \'frobnicate)
        ```
      END
      td_notes <<-'END'
        ```clojure
        ; [Bar.|
        ; [Bar.]|
        ```
      END
    end

    entry do
      command '"'
      command 'paredit-doublequote'
      td_notes <<-'END' 
        ```clojure
        (frob grovel |full lexical)
        (frob grovel "|" full lexical)
        ```
      END
      td_notes <<-'END'
        ```clojure
        (foo "bar |baz" quux)
        (foo "bar \"|baz" quux)
        ```
      END
    end

    entry do
      command 'M-"'
      command 'paredit-meta-doublequote'
      td_notes <<-'END' 
        ```clojure
        (foo "bar |baz" quux)
        (foo "bar baz" |quux)
        ```
      END
      td_notes <<-'END'
        ```clojure
        (foo |(bar #\x "baz \\ quux") zot)
        (foo "|(bar #\\x \"baz \\\\ quux\")" zot)
        ```
      END
    end

    entry do
      command '\\'
      command 'paredit-backslash'
      td_notes <<-'END' 
        ```clojure
        (string #|)
        Escaping character... (x)
        (string #\x|)
        ```
      END
      td_notes <<-'END'
        ```clojure
        "foo|bar"
        Escaping character... (")
        "foo\"|bar"
        ```
      END
    end

    entry do
      command 'M-;'
      command 'paredit-comment-dwim'
      td_notes <<-'END' 
        ```clojure
        (foo |bar) ; baz
        (foo bar)  ; |baz
        ```
        ```clojure
        (frob grovel)|
        (frob grovel) ;|
        ```
      END
      td_notes <<-'END'
        ```clojure
        |(defun hello-world ...)
        ;;; |
        (defun hello-world ...)
        ```
      END
    end

    entry do
      command 'C-j'
      command 'paredit-newline'
      td_notes <<-'END' 
        ```clojure
        (let ((n (frobbotz))) |(display (+n 1) port))
        (let ((n (frobbotz)))
          |(display (+n 1) port))
        ```
      END
    end
  end

  category do
    id 'Deleting & Killing'

    entry do
      command 'C-d'
      command '<delete>'
      command '<deletechar>'
      command 'paredit-forward-delete'
      td_notes <<-'END'
        ```clojure
        (quu|x "zot")
        (quu| "zot")
        ```
        ```clojure
        (quux |"zot")
        (quux "|zot")
        (quux "|ot")
        ```
      END
      td_notes <<-'END'
        ```clojure
        (foo (|) bar)
        (foo | bar)
        ```
        ```clojure
        |(foo bar)
        (|foo bar)
        ```
      END
    end

    entry do
      command 'DEL'
      command 'paredit-backward-delete'
      td_notes <<-'END'
        ```clojure
        ("zot" q|uux)
        ("zot" |uux)
        ("zot"| quux)
        ("zot|" quux)
        ("zo|" quux)
        ```
      END
      td_notes <<-'END'
        ```clojure
        (foo (|) bar)
        (foo | bar)
        ```
        ```clojure
        (foo bar)|
        (foo bar|)
        ```
    END
    end

    entry do
      command 'C-k'
      command 'paredit-kill'
      td_notes <<-'END'
        ```clojure
        (foo bar)| ; Useless comment!
        (foo bar)|
        ```
        ```clojure
        (|foo bar) ; Useful comment!
        (|) ;Useful comment!
        ```
      END
      td_notes <<-'END'
        ```clojure
        |(foo bar) ; Useless line!
        |
        ```
        ```clojure
        (foo "|bar baz"
          quux)
        (foo "|"
          quux)
        ```
      END
    end

    entry do
      command 'M-d'
      command 'paredit-forward-kill-word'
      td_notes <<-'END'
        ```clojure
        |(foo bar) ; baz
        (| bar) ;baz
        (|) ; baz
        () ;|
        ```
      END
      td_notes <<-'END'
        ```clojure
        ;;;| Frobnicate
        (defun frobnicate ...)
        ;;;|
        (defun frobnicate ...)
        ;;;
        (| frobnicate ...)
        ```
      END
    end
  end

  category do
    id 'Movement & Navigation'

    entry do
      command 'C-M-f'
      command 'paredit-forward'
      td_notes <<-'END'
        ```clojure
        (foo |(bar baz) quux)
        (foo (bar baz)| quux)
        ```
      END
      td_notes <<-'END'
        ```clojure
        (foo (bar)|)
        (foo (bar))|
        ```
      END
    end

    entry do
      command 'C-M-b'
      command 'paredit-backward'
      td_notes <<-'END'
        ```clojure
        (foo (bar baz)| quux)
        (foo |(bar baz) quux)
        ```
      END
      td_notes <<-'END'
        ```clojure
        (|(foo) bar)
        |((foo) bar)
        ```
      END
    end
  end

  category do
    id 'Depth-Changing Commands'

    entry do
      command 'M-('
      command 'paredit-wrap-around'
      td_notes <<-'END'
        ```clojure
        (foo |bar baz)
        (foo (|bar) baz)
        ```
      END
    end

    entry do
      command 'M-s'
      command 'paredit-splice-sexp'
      td_notes <<-'END'
        ```clojure
        (foo (bar| baz) quux)
        (foo bar| baz quux)
        ```
      END
    end

    entry do
      command 'M-<up>'
      command 'ESC <up>'
      command 'paredit-splice-killing-backward'
      td_notes <<-'END'
        ```clojure
        (a(bc|de)f)
        (a b c| f)
        ```
      END
    end

    entry do
      command 'M-<down>'
      command 'ESC <down>'
      command 'paredit-splice-killing-forward'
      td_notes <<-'END'
        ```clojure
        (a(bc|de)f)
        (a b c| f)
        ```
      END
    end

    entry do
      command 'M-r'
      command 'paredit-raise-sexp'
      td_notes <<-'END'
        ```clojure
        (dynamic-wind in (lambda () |body) out)
        (dynamic-wind in |body out)
        ```
      END
    end
  end

  category do
    id 'Barfage & Slurpage'

    entry do
      command 'C-)'
      command 'C-<right>'
      command 'paredit-forward-slurp-sexp'
      td_notes <<-'END'
        ```clojure
        (foo (bar |baz) quux zot)
        (foo (bar |baz quux) zot)
        ```
      END
      td_notes <<-'END'
        ```clojure
        (a b ((c| d)) e f)
        (a b ((c| d) e) f)
        ```
      END
    end

    entry do
      command 'C-}'
      command 'C-<left>'
      command 'paredit-forward-barf-sexp'
      td_notes <<-'END'
        ```clojure
        (foo (bar |baz quux) zot)
        (foo (bar |baz) quux zot)
        ```
      END
    end

    entry do
      command 'C-('
      command 'C-M-<left>'
      command 'ESC C-<left>'
      td_notes <<-'END'
        ```clojure
        (foo bar (baz| quux) zot)
        (foo (bar| baz quux) zot)
        ```
      END
      td_notes <<-'END'
        ```clojure
        (ab((c|d))ef)
        (a (b (c| d) e) f)
        ```
      END
    end

    entry do
      command 'C-{'
      command 'C-M-<right>'
      command 'ESC C-<right>'
      td_notes <<-'END'
        ```clojure
        (foo (bar baz |quux) zot)
        (foo bar (baz |quux) zot)
        ```
      END
    end
  end

  category do
    id 'Miscellaneous Commands'

    entry do
      command 'M-S'
      command 'paredit-split-sexp'
      td_notes <<-'END'
        ```clojure
        (hello| world)
        (hello)| (world)
        ```
      END
      td_notes <<-'END'
      ```clojure
      "Hello, |world!"
      "Hello, "| "world!"
      ```
    END
    end

    entry do
      command 'M-J'
      command 'paredit-join-sexp'
      td_notes <<-'END'
        ```clojure
        (hello)| (world)
        (hello| world)
        ```
        ```clojure
        "Hello, "| "world!"
        "Hello, |world!"
        ```
      END
      td_notes <<-'END'
        ```clojure
        hello-
        | world
        hello-|world
        ```
      END
    end
  end
end
