module Enumerable
  
def my_each
    i=0
   while i!=self.length
    yield(self, i)
    i+=1
   end 
 end 
 
#arr=[1,2,4,5,6]
#my_each(arr) { |p, i| puts "#{p[i]}"}

def my_each_with_index
    i=0
   while i!=self.length
    j=self.index(self[i])
    yield(self, i, j)
    i+=1
   end 
 end

def my_select
  newarr=[]
   i=0
   while i!=self.length-1
    if yield(self, i)==true
      newarr<< self[i]
    end
    i+=1
   end
   newarr
end

def my_all?
  i=0
  all=true
   while i!=self.length
    if yield(self, i)==false
      all=false
    end
    i+=1
   end 
  all
end

def my_any?
  i=0
  any=false
   while i!=self.length
    if yield(self, i)==true
      any=true
    end
    i+=1
   end 
  any
end

def my_none?
  i=0
  none=true
   while i!=self.length
    if yield(self, i)==true
      none=false
    end
    i+=1
   end 
  none
end

def my_count
    i=0
   while i!=self.length
    i+=1
   end
   i
 end 
end

def my_map
  newarr=[]
     i=0
   while i!=self.length
    newarr<< yield(self, i)
    i+=1
   end
   newarr
end

def my_map_mod(&param)
  newarr=[]
     i=0
   while i!=self.length
    newarr<< yield(self,i)
    i+=1
   end
   newarr
end

def my_map_proc_or_block(p=nil)
  newarr=[]
     i=0
   while i!=self.length
    if p!=nil && block_given?
    newarr<< p.call(self,i)
  else
    newarr<< yield(self,i)
    end  
    i+=1
   end
   newarr
end

def my_inject
   newval=0
     i=0
   while i!=self.length
    newval= yield(newval, self[i])
    i+=1
   end
   newval
end

def multiply_els(arr)
  newnum=arr.my_inject(1) {|x,y| x*=y}  
end

end