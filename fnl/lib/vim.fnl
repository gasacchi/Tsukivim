;; Module contains function wrapper around vim lua api
(fn defer-fn [f timeout]
  "Defer calling `f` function until timout(ms) passes"
  (vim.defer_fn f timeout))

(fn inspect [obj ?opt]
  "Return human readable presentation of given object
  see: https://github.com/kikito/inspect.lua for more option `?opt`"
 (vim.inspect obj (or ?opt nil))) 

(fn notify [msg level ?opt]
  "Display notification to user"
  (vim.notify msg level (or ?opt nil)))

(fn deep-equal [a b]
  "Deep compare two values for equality"
  (vim.deep_equal a b))

(fn deep-copy [obj]
  "Deep copy given object"
  (vim.deepcopy obj))

(fn startswith [str suffix]
  "Return true if string `str` starts with `suffix`"
  (vim.startswith str suffix))

(fn endswith [str suffix]
  "Return true if string `str` ends with `suffix`"
  (vim.endswith str suffix))

(fn is-function? [f]
  "Return true if f is function / callable otherwise false"
  (vim.is_callable f))

(fn slice [list start finish]
  "Create copy of table containing only elements 
  from start to finish (inclusive)"
  (vim.list_slice list start finish))

(fn split [str separator kwargs]
  "split string at each instance of separator"
  (vim.split str separator kwargs))

(fn extend [behaviour ...]
  "Merges two table"
  (vim.tbl_extend behaviour ...))

{: defer-fn
 : inspect
 : notify
 : deep-equal 
 : endswith
 : extend}
