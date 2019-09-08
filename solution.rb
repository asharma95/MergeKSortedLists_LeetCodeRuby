# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode[]} lists
# @return {ListNode}
def merge_k_lists(lists)
    return [] if lists.empty?
    hash={}
    arr2=([])
    (0...lists.length).each do |ele|
        node=lists[ele]
        while node != nil
            arr2 << node.val
            if hash[node.val] == nil
                hash[node.val] = [node,node]
                temp=node
                node=node.next
                temp.next=nil
            else
                arr=hash[node.val]
                arr[1].next=node
                arr[1]=node
                temp=node
                node=node.next
                temp.next=nil
            end
        end
    end
    p1=nil
    head=nil
    min=arr2.min
    max=arr2.max
    return [] if arr2.empty?
    (min..max).each do |ele|
        if hash[ele] != nil && p1 == nil
            arr=hash[ele]
            p1=arr[1]
            if arr[0].val == min
                head=arr[0]
            end
        elsif hash[ele] != nil && p1 != nil
            arr=hash[ele]
            p1.next=arr[0]
            p1=arr[1]
        else
            next
        end
    end
    return head
end
def merge(left,right)
    if left.empty?
        return right
    elsif right.empty?
        return left
    elsif left.first < right.first
        [left.first]+merge(left[1..-1],right)
    else
        [right.first]+merge(left,right[1..-1])
    end
end
