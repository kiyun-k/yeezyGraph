; ModuleID = 'MicroC'

%struct.QueueId = type { %struct.Node*, %struct.Node*, i32 }
%struct.Node = type { i8*, %struct.Node* }
%struct.List = type { %struct.ListNode*, i32 }
%struct.ListNode = type { i8*, %struct.ListNode* }
%struct.pqueue = type { %struct.node**, i32, i32 }
%struct.node = type { i8*, i8, %struct.map*, %struct.map*, i8* }
%struct.map = type { i32, i32, i8**, i32* }
%struct.graph = type { %struct.List.5*, i32 }
%struct.List.5 = type { %struct.ListNode.4*, i32 }
%struct.ListNode.4 = type { i8*, %struct.ListNode.4* }

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@fmt1 = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@fmt2 = private unnamed_addr constant [3 x i8] c"%d\00"
@fmt3 = private unnamed_addr constant [3 x i8] c"%s\00"
@fmt4 = private unnamed_addr constant [4 x i8] c"%f\0A\00"
@str = private unnamed_addr constant [2 x i8] c"a\00"
@str5 = private unnamed_addr constant [2 x i8] c"b\00"
@str6 = private unnamed_addr constant [2 x i8] c"c\00"
@str7 = private unnamed_addr constant [2 x i8] c"d\00"
@fmt8 = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@fmt9 = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@fmt10 = private unnamed_addr constant [3 x i8] c"%d\00"
@fmt11 = private unnamed_addr constant [3 x i8] c"%s\00"
@fmt12 = private unnamed_addr constant [4 x i8] c"%f\0A\00"
@str13 = private unnamed_addr constant [29 x i8] c"BFS traversal of the graph: \00"
@str14 = private unnamed_addr constant [5 x i8] c" -> \00"

declare i32 @printf(i8*, ...)

declare %struct.QueueId* @initQueueId()

declare void @enqueue(%struct.QueueId*, i8*)

declare void @dequeue(%struct.QueueId*)

declare i8* @front(%struct.QueueId*)

declare i32 @q_size(%struct.QueueId*)

declare %struct.List* @l_init()

declare void @l_add(%struct.List*, i8*)

declare void @l_delete(%struct.List*, i32)

declare i8* @l_get(%struct.List*, i32)

declare i32 @l_size(%struct.List*)

declare void @print_list(%struct.List*)

declare %struct.pqueue* @pq_init()

declare void @pq_push(%struct.pqueue*, %struct.node*)

declare %struct.node* @pq_delete(%struct.pqueue*)

declare i32 @p_size(%struct.pqueue*)

declare %struct.node* @n_init(i8*)

declare void @set_data(%struct.node*, i8*)

declare i8* @get_name(%struct.node*)

declare i1 @get_visited(%struct.node*)

declare void @modify_visited(%struct.node*, i1)

declare i8* @get_data(%struct.node*)

declare %struct.List* @get_inNodes(%struct.node*)

declare %struct.List* @get_outNodes(%struct.node*)

declare %struct.graph* @g_init()

declare void @addNode(%struct.graph*, %struct.node*)

declare void @removeNode(%struct.graph*, %struct.node*)

declare void @addEdge(%struct.graph*, %struct.node*, %struct.node*, i32)

declare void @removeEdge(%struct.graph*, %struct.node*, %struct.node*)

declare void @printGraph(%struct.graph*)

declare i1 @isEmpty(%struct.graph*)

declare i32 @size(%struct.graph*)

declare i1 @contains(%struct.graph*, i8*)

declare %struct.node* @getNode(%struct.graph*, i8*)

declare i32 @getWeight(%struct.graph*, %struct.node*, %struct.node*)

define i32 @main() {
entry:
  %g1 = alloca %struct.graph*
  %a1 = alloca i8*
  %a2 = alloca i8*
  %a3 = alloca i8*
  %a4 = alloca i8*
  %i = alloca i32
  %a = alloca %struct.node*
  %b = alloca %struct.node*
  %c = alloca %struct.node*
  %d = alloca %struct.node*
  store i8* getelementptr inbounds ([2 x i8]* @str, i32 0, i32 0), i8** %a1
  store i8* getelementptr inbounds ([2 x i8]* @str5, i32 0, i32 0), i8** %a2
  store i8* getelementptr inbounds ([2 x i8]* @str6, i32 0, i32 0), i8** %a3
  store i8* getelementptr inbounds ([2 x i8]* @str7, i32 0, i32 0), i8** %a4
  %init = call %struct.graph* @g_init()
  store %struct.graph* %init, %struct.graph** %g1
  %char_n_val_pointer = load i8** %a1
  %init1 = call %struct.node* @n_init(i8* %char_n_val_pointer)
  %node_alloca = alloca %struct.node*
  store %struct.node* %init1, %struct.node** %node_alloca
  %graph_pointer = load %struct.graph** %g1
  %node_pointer = load %struct.node** %node_alloca
  call void @addNode(%struct.graph* %graph_pointer, %struct.node* %node_pointer)
  %char_n_val_pointer2 = load i8** %a2
  %init3 = call %struct.node* @n_init(i8* %char_n_val_pointer2)
  %node_alloca4 = alloca %struct.node*
  store %struct.node* %init3, %struct.node** %node_alloca4
  %graph_pointer5 = load %struct.graph** %g1
  %node_pointer6 = load %struct.node** %node_alloca4
  call void @addNode(%struct.graph* %graph_pointer5, %struct.node* %node_pointer6)
  %char_n_val_pointer7 = load i8** %a3
  %init8 = call %struct.node* @n_init(i8* %char_n_val_pointer7)
  %node_alloca9 = alloca %struct.node*
  store %struct.node* %init8, %struct.node** %node_alloca9
  %graph_pointer10 = load %struct.graph** %g1
  %node_pointer11 = load %struct.node** %node_alloca9
  call void @addNode(%struct.graph* %graph_pointer10, %struct.node* %node_pointer11)
  %char_n_val_pointer12 = load i8** %a4
  %init13 = call %struct.node* @n_init(i8* %char_n_val_pointer12)
  %node_alloca14 = alloca %struct.node*
  store %struct.node* %init13, %struct.node** %node_alloca14
  %graph_pointer15 = load %struct.graph** %g1
  %node_pointer16 = load %struct.node** %node_alloca14
  call void @addNode(%struct.graph* %graph_pointer15, %struct.node* %node_pointer16)
  %g117 = load %struct.graph** %g1
  %char_n_val_pointer18 = load i8** %a1
  %0 = call %struct.node* @getNode(%struct.graph* %g117, i8* %char_n_val_pointer18)
  store %struct.node* %0, %struct.node** %a
  %g119 = load %struct.graph** %g1
  %char_n_val_pointer20 = load i8** %a2
  %1 = call %struct.node* @getNode(%struct.graph* %g119, i8* %char_n_val_pointer20)
  store %struct.node* %1, %struct.node** %b
  %g121 = load %struct.graph** %g1
  %char_n_val_pointer22 = load i8** %a3
  %2 = call %struct.node* @getNode(%struct.graph* %g121, i8* %char_n_val_pointer22)
  store %struct.node* %2, %struct.node** %c
  %g123 = load %struct.graph** %g1
  %char_n_val_pointer24 = load i8** %a4
  %3 = call %struct.node* @getNode(%struct.graph* %g123, i8* %char_n_val_pointer24)
  store %struct.node* %3, %struct.node** %d
  %g125 = load %struct.graph** %g1
  %e1_val_pointer = load %struct.node** %a
  %e2_val_pointer = load %struct.node** %b
  call void @addEdge(%struct.graph* %g125, %struct.node* %e1_val_pointer, %struct.node* %e2_val_pointer, i32 1)
  %g126 = load %struct.graph** %g1
  %e1_val_pointer27 = load %struct.node** %a
  %e2_val_pointer28 = load %struct.node** %c
  call void @addEdge(%struct.graph* %g126, %struct.node* %e1_val_pointer27, %struct.node* %e2_val_pointer28, i32 2)
  %g129 = load %struct.graph** %g1
  %e1_val_pointer30 = load %struct.node** %b
  %e2_val_pointer31 = load %struct.node** %a
  call void @addEdge(%struct.graph* %g129, %struct.node* %e1_val_pointer30, %struct.node* %e2_val_pointer31, i32 1)
  %g132 = load %struct.graph** %g1
  %e1_val_pointer33 = load %struct.node** %b
  %e2_val_pointer34 = load %struct.node** %d
  call void @addEdge(%struct.graph* %g132, %struct.node* %e1_val_pointer33, %struct.node* %e2_val_pointer34, i32 10)
  %g135 = load %struct.graph** %g1
  %e1_val_pointer36 = load %struct.node** %c
  %e2_val_pointer37 = load %struct.node** %a
  call void @addEdge(%struct.graph* %g135, %struct.node* %e1_val_pointer36, %struct.node* %e2_val_pointer37, i32 2)
  %g138 = load %struct.graph** %g1
  %e1_val_pointer39 = load %struct.node** %c
  %e2_val_pointer40 = load %struct.node** %d
  call void @addEdge(%struct.graph* %g138, %struct.node* %e1_val_pointer39, %struct.node* %e2_val_pointer40, i32 5)
  %g141 = load %struct.graph** %g1
  %e1_val_pointer42 = load %struct.node** %d
  %e2_val_pointer43 = load %struct.node** %b
  call void @addEdge(%struct.graph* %g141, %struct.node* %e1_val_pointer42, %struct.node* %e2_val_pointer43, i32 10)
  %g144 = load %struct.graph** %g1
  %e1_val_pointer45 = load %struct.node** %d
  %e2_val_pointer46 = load %struct.node** %c
  call void @addEdge(%struct.graph* %g144, %struct.node* %e1_val_pointer45, %struct.node* %e2_val_pointer46, i32 5)
  %a47 = load %struct.node** %a
  %g148 = load %struct.graph** %g1
  call void @BFS(%struct.graph* %g148, %struct.node* %a47)
  ret i32 0
}

define void @BFS(%struct.graph* %g1, %struct.node* %source) {
entry:
  %g11 = alloca %struct.graph*
  store %struct.graph* %g1, %struct.graph** %g11
  %source2 = alloca %struct.node*
  store %struct.node* %source, %struct.node** %source2
  %p = alloca %struct.QueueId*
  %listtemp = alloca %struct.List*
  %temp = alloca %struct.node*
  %temp2 = alloca %struct.node*
  %i = alloca i32
  %tmpstring = alloca i8*
  %init = call %struct.QueueId* @initQueueId()
  store %struct.QueueId* %init, %struct.QueueId** %p
  %source3 = load %struct.node** %source2
  call void @modify_visited(%struct.node* %source3, i1 true)
  %p4 = load %struct.QueueId** %p
  %source5 = load %struct.node** %source2
  %malloccall = tail call i8* @malloc(i32 ptrtoint (i1** getelementptr (i1** null, i32 1) to i32))
  %tmp = bitcast i8* %malloccall to %struct.node**
  store %struct.node* %source5, %struct.node** %tmp
  %ptr = bitcast %struct.node** %tmp to i8*
  call void @enqueue(%struct.QueueId* %p4, i8* %ptr)
  %printf = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @fmt9, i32 0, i32 0), i8* getelementptr inbounds ([29 x i8]* @str13, i32 0, i32 0))
  br label %while

while:                                            ; preds = %merge34, %entry
  %p38 = load %struct.QueueId** %p
  %0 = call i32 @q_size(%struct.QueueId* %p38)
  %tmp39 = icmp ne i32 %0, 0
  br i1 %tmp39, label %while_body, label %merge40

while_body:                                       ; preds = %while
  %p6 = load %struct.QueueId** %p
  %val_ptr = call i8* @front(%struct.QueueId* %p6)
  %d_ptr = bitcast i8* %val_ptr to %struct.node**
  %d_ptr7 = load %struct.node** %d_ptr
  store %struct.node* %d_ptr7, %struct.node** %temp
  %temp8 = load %struct.node** %temp
  %getName = call i8* @get_name(%struct.node* %temp8)
  %printf9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @fmt11, i32 0, i32 0), i8* %getName)
  %p10 = load %struct.QueueId** %p
  call void @dequeue(%struct.QueueId* %p10)
  %temp11 = load %struct.node** %temp
  %getOutNodes = call %struct.List* @get_outNodes(%struct.node* %temp11)
  store %struct.List* %getOutNodes, %struct.List** %listtemp
  store i32 0, i32* %i
  br label %while12

while12:                                          ; preds = %merge, %while_body
  %i28 = load i32* %i
  %listtemp29 = load %struct.List** %listtemp
  %1 = call i32 @l_size(%struct.List* %listtemp29)
  %tmp30 = icmp slt i32 %i28, %1
  br i1 %tmp30, label %while_body13, label %merge31

while_body13:                                     ; preds = %while12
  %listtemp14 = load %struct.List** %listtemp
  %i15 = load i32* %i
  %val_ptr16 = call i8* @l_get(%struct.List* %listtemp14, i32 %i15)
  store i8* %val_ptr16, i8** %tmpstring
  %g117 = load %struct.graph** %g11
  %char_n_val_pointer = load i8** %tmpstring
  %2 = call %struct.node* @getNode(%struct.graph* %g117, i8* %char_n_val_pointer)
  store %struct.node* %2, %struct.node** %temp2
  %temp218 = load %struct.node** %temp2
  %getVisited = call i1 @get_visited(%struct.node* %temp218)
  %tmp19 = icmp eq i1 %getVisited, false
  br i1 %tmp19, label %then, label %else

merge:                                            ; preds = %else, %then
  %i26 = load i32* %i
  %tmp27 = add i32 %i26, 1
  store i32 %tmp27, i32* %i
  br label %while12

then:                                             ; preds = %while_body13
  %temp220 = load %struct.node** %temp2
  call void @modify_visited(%struct.node* %temp220, i1 true)
  %p21 = load %struct.QueueId** %p
  %temp222 = load %struct.node** %temp2
  %malloccall23 = tail call i8* @malloc(i32 ptrtoint (i1** getelementptr (i1** null, i32 1) to i32))
  %tmp24 = bitcast i8* %malloccall23 to %struct.node**
  store %struct.node* %temp222, %struct.node** %tmp24
  %ptr25 = bitcast %struct.node** %tmp24 to i8*
  call void @enqueue(%struct.QueueId* %p21, i8* %ptr25)
  br label %merge

else:                                             ; preds = %while_body13
  br label %merge

merge31:                                          ; preds = %while12
  %p32 = load %struct.QueueId** %p
  %3 = call i32 @q_size(%struct.QueueId* %p32)
  %tmp33 = icmp ne i32 %3, 0
  br i1 %tmp33, label %then35, label %else37

merge34:                                          ; preds = %else37, %then35
  br label %while

then35:                                           ; preds = %merge31
  %printf36 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @fmt11, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8]* @str14, i32 0, i32 0))
  br label %merge34

else37:                                           ; preds = %merge31
  br label %merge34

merge40:                                          ; preds = %while
  ret void
}

declare noalias i8* @malloc(i32)
