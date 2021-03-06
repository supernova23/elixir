
defmodule Util do
	@me "younes meliani"

	def square([]), do: []
    def square([ head | tail ]), do: [ head*head | square(tail) ]

    def map([], _fun), do: []
    def map([head|tail], func), do: [ func.(head) | map(tail, func) ]

    def mapsum([], _fun), do: 0
    def mapsum([head|tail], func), do: func.(head) + mapsum(tail, func)

    def search([], _), do: false
    def search([head|_], head), do: true
    def search([_|tail], head), do: search(tail, head)

    def reduce([], val, _), do: val
    def reduce([head|tail], val, func), do: reduce(tail, func.(head, val), func)

    def max([]), do: nil
    def max([head|tail]), do: reduce([head|tail], head, fn (new, before) -> if new > before, do: new, else: before end)	

    def filter([], _val), do: []
    def filter([head = [_,val] |tail], val), do: [head | filter(tail, val)]
    def filter([_|tail], val), do: filter(tail, val)

    def span(to, to), do: [to]
    def span(from, to) when from < to, do: [from| span(from+1, to)]
end