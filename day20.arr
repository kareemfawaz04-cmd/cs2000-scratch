use context dcic2024



fun add-still-zero(l :: List<Number>) -> Number :
  doc:"adds element of thhe list until we hit a 0"
  cases (List)l:
    |empty => 0
    | link(f , r) =>
      if f == 0:
        0
      else:
        f + add-still-zero(r)
      end
  end
  
  
  
where:
  add-still-zero([list: 5, 4, 0, 3]) is 5 + add-still-zero([list: 4, 0, 3])
  add-still-zero([list: 4, 0, 3]) is 4 +  add-still-zero([list: 0, 3])
  #  when u see a zero stop
  add-still-zero([list: 0, 3]) is 0 
  add-still-zero([list: ]) is 0
end

# fun add-till-zero( l :: List<Number>) -> Number:
  





