module Enumerable

def my_each
  return "This needs a block" unless block_given?
  i=0
  while i!=self.length
    yield(self, i)
    i+=1
  end 
 end 
 
def my_each_with_index
  return "This needs a block" unless block_given?
  i=0
   while i!=self.length
    j=self.index(self[i])
    yield(self, i, j)
    i+=1
   end 
 end

def my_select
  newarr=[]
  return newarr unless block_given? 
   i=0
   while i<self.length
    if yield(self, i)==true
      newarr << self[i]
    end
    i+=1
   end
   newarr
end

def my_all?
  i=0
  all=true
   while i<self.length
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
  return nil if self==nil
    i=0
   while i!=self.length
    i+=1
   end
   i
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
   return nil if self.length==0
    newval=self[0]
    raise "This should not have letters" if self[0]==self[0].to_s
     i=1
   while i<self.length
    raise "This should not have letters" if self[i]==self[i].to_s
    newval= yield(newval, self[i].to_i)
    i+=1
   end
   newval
end

def multiply_els
  newnum=self.my_inject {|x,y| x*=y}  
end

end

class Array
  include Enumerable
end
