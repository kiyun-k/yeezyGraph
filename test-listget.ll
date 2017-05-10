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
  %listtemp = alloca %struct.List*
  %listtemp1 = alloca %struct.List*
  %listtemp2 = alloca %struct.List*
  %x = alloca i8*
  %y = alloca i32
  %z = alloca %struct.node*
  %node1 = alloca %struct.node*
  %node2 = alloca %struct.node*
  %node3 = alloca %struct.node*
  %a = alloca i8*
  %b = alloca i8*
  %c = alloca i8*
  store i8* getelementptr inbounds ([2 x i8]* @str, i32 0, i32 0), i8** %a
  store i8* getelementptr inbounds ([2 x i8]* @str5, i32 0, i32 0), i8** %b
  store i8* getelementptr inbounds ([2 x i8]* @str6, i32 0, i32 0), i8** %c
  %init = call %struct.List* @l_init()
  store %struct.List* %init, %struct.List** %listtemp
  %init1 = call %struct.List* @l_init()
  %malloccall = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32* null, i32 1) to i32))
  %tmp = bitcast i8* %malloccall to i32*
  store i32 1, i32* %tmp
  %ptr = bitcast i32* %tmp to i8*
  call void @l_add(%struct.List* %init1, i8* %ptr)
  %malloccall2 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32* null, i32 1) to i32))
  %tmp3 = bitcast i8* %malloccall2 to i32*
  store i32 2, i32* %tmp3
  %ptr4 = bitcast i32* %tmp3 to i8*
  call void @l_add(%struct.List* %init1, i8* %ptr4)
  %malloccall5 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32* null, i32 1) to i32))
  %tmp6 = bitcast i8* %malloccall5 to i32*
  store i32 3, i32* %tmp6
  %ptr7 = bitcast i32* %tmp6 to i8*
  call void @l_add(%struct.List* %init1, i8* %ptr7)
  %malloccall8 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32* null, i32 1) to i32))
  %tmp9 = bitcast i8* %malloccall8 to i32*
  store i32 4, i32* %tmp9
  %ptr10 = bitcast i32* %tmp9 to i8*
  call void @l_add(%struct.List* %init1, i8* %ptr10)
  store %struct.List* %init1, %struct.List** %listtemp1
  %init11 = call %struct.List* @l_init()
  store %struct.List* %init11, %struct.List** %listtemp2
  %char_n_val_pointer = load i8** %a
  %init_n = call %struct.node* @n_init(i8* %char_n_val_pointer)
  store %struct.node* %init_n, %struct.node** %node1
  %char_n_val_pointer12 = load i8** %b
  %init_n13 = call %struct.node* @n_init(i8* %char_n_val_pointer12)
  store %struct.node* %init_n13, %struct.node** %node2
  %char_n_val_pointer14 = load i8** %c
  %init_n15 = call %struct.node* @n_init(i8* %char_n_val_pointer14)
  store %struct.node* %init_n15, %struct.node** %node3
  %listtemp16 = load %struct.List** %listtemp
  %a17 = load i8** %a
  call void @l_add(%struct.List* %listtemp16, i8* %a17)
  %listtemp18 = load %struct.List** %listtemp
  %b19 = load i8** %b
  call void @l_add(%struct.List* %listtemp18, i8* %b19)
  %listtemp20 = load %struct.List** %listtemp
  %c21 = load i8** %c
  call void @l_add(%struct.List* %listtemp20, i8* %c21)
  %listtemp222 = load %struct.List** %listtemp2
  %node123 = load %struct.node** %node1
  %malloccall24 = tail call i8* @malloc(i32 ptrtoint (i1** getelementptr (i1** null, i32 1) to i32))
  %tmp25 = bitcast i8* %malloccall24 to %struct.node**
  store %struct.node* %node123, %struct.node** %tmp25
  %ptr26 = bitcast %struct.node** %tmp25 to i8*
  call void @l_add(%struct.List* %listtemp222, i8* %ptr26)
  %listtemp227 = load %struct.List** %listtemp2
  %node228 = load %struct.node** %node2
  %malloccall29 = tail call i8* @malloc(i32 ptrtoint (i1** getelementptr (i1** null, i32 1) to i32))
  %tmp30 = bitcast i8* %malloccall29 to %struct.node**
  store %struct.node* %node228, %struct.node** %tmp30
  %ptr31 = bitcast %struct.node** %tmp30 to i8*
  call void @l_add(%struct.List* %listtemp227, i8* %ptr31)
  %listtemp232 = load %struct.List** %listtemp2
  %node333 = load %struct.node** %node3
  %malloccall34 = tail call i8* @malloc(i32 ptrtoint (i1** getelementptr (i1** null, i32 1) to i32))
  %tmp35 = bitcast i8* %malloccall34 to %struct.node**
  store %struct.node* %node333, %struct.node** %tmp35
  %ptr36 = bitcast %struct.node** %tmp35 to i8*
  call void @l_add(%struct.List* %listtemp232, i8* %ptr36)
  %listtemp37 = load %struct.List** %listtemp
  %val_ptr = call i8* @l_get(%struct.List* %listtemp37, i32 0)
  store i8* %val_ptr, i8** %x
  %listtemp138 = load %struct.List** %listtemp1
  %val_ptr39 = call i8* @l_get(%struct.List* %listtemp138, i32 0)
  %d_ptr = bitcast i8* %val_ptr39 to i32*
  %d_ptr40 = load i32* %d_ptr
  store i32 %d_ptr40, i32* %y
  %listtemp241 = load %struct.List** %listtemp2
  %val_ptr42 = call i8* @l_get(%struct.List* %listtemp241, i32 0)
  %d_ptr43 = bitcast i8* %val_ptr42 to %struct.node**
  %d_ptr44 = load %struct.node** %d_ptr43
  store %struct.node* %d_ptr44, %struct.node** %z
  %x45 = load i8** %x
  %printf = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @fmt1, i32 0, i32 0), i8* %x45)
  %y46 = load i32* %y
  %printf47 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @fmt, i32 0, i32 0), i32 %y46)
  %z48 = load %struct.node** %z
  %getName = call i8* @get_name(%struct.node* %z48)
  %printf49 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @fmt1, i32 0, i32 0), i8* %getName)
  ret i32 0
}

declare noalias i8* @malloc(i32)
