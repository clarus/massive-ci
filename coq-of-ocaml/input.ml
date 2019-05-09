let head l =
  match l with
  | [] -> failwith "empty list"
  | x :: _ -> x
