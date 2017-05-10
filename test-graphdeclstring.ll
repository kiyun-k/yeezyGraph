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
@str = private unnamed_addr constant [4 x i8] c"abc\00"
@str5 = private unnamed_addr constant [4 x i8] c"def\00"
@str6 = private unnamed_addr constant [4 x i8] c"abc\00"

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
  %x = alloca i32
  %a1 = alloca i8*
  %a2 = alloca i8*
  %a3 = alloca i8*
  %a4 = alloca i8*
  %y = alloca i32
  %n1 = alloca %struct.node*
  %n2 = alloca %struct.node*
  %l = alloca %struct.List*
  %init = call %struct.List* @l_init()
  store %struct.List* %init, %struct.List** %l
  %init1 = call %struct.graph* @g_init()
  store %struct.graph* %init1, %struct.graph** %g1
  store i8* getelementptr inbounds ([4 x i8]* @str, i32 0, i32 0), i8** %a1
  store i8* getelementptr inbounds ([4 x i8]* @str5, i32 0, i32 0), i8** %a2
  %char_n_val_pointer = load i8** %a1
  %init2 = call %struct.node* @n_init(i8* %char_n_val_pointer)
  %node_alloca = alloca %struct.node*
  store %struct.node* %init2, %struct.node** %node_alloca
  %graph_pointer = load %struct.graph** %g1
  %node_pointer = load %struct.node** %node_alloca
  call void @addNode(%struct.graph* %graph_pointer, %struct.node* %node_pointer)
  %char_n_val_pointer3 = load i8** %a2
  %init4 = call %struct.node* @n_init(i8* %char_n_val_pointer3)
  %node_alloca5 = alloca %struct.node*
  store %struct.node* %init4, %struct.node** %node_alloca5
  %graph_pointer6 = load %struct.graph** %g1
  %node_pointer7 = load %struct.node** %node_alloca5
  call void @addNode(%struct.graph* %graph_pointer6, %struct.node* %node_pointer7)
  %g18 = load %struct.graph** %g1
  %char_n_val_pointer9 = load i8** %a1
  %0 = call %struct.node* @getNode(%struct.graph* %g18, i8* %char_n_val_pointer9)
  store %struct.node* %0, %struct.node** %n1
  %n110 = load %struct.node** %n1
  %malloccall = tail call i8* @malloc(i32 ptrtoint (i1** getelementptr (i1** null, i32 1) to i32))
  %tmp = bitcast i8* %malloccall to i8**
  store i8* getelementptr inbounds ([4 x i8]* @str6, i32 0, i32 0), i8** %tmp
  %ptr = bitcast i8** %tmp to i8*
  call void @set_data(%struct.node* %n110, i8* %ptr)
  %n111 = load %struct.node** %n1
  %getData = call i8* @get_data(%struct.node* %n111)
  %d_ptr = bitcast i8* %getData to i8**
  %d_ptr12 = load i8** %d_ptr
  store i8* %d_ptr12, i8** %a3
  %a313 = load i8** %a3
  %printf = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @fmt1, i32 0, i32 0), i8* %a313)
  %g114 = load %struct.graph** %g1
  %char_n_val_pointer15 = load i8** %a2
  %1 = call %struct.node* @getNode(%struct.graph* %g114, i8* %char_n_val_pointer15)
  store %struct.node* %1, %struct.node** %n2
  %g116 = load %struct.graph** %g1
  %e1_val_pointer = load %struct.node** %n1
  %e2_val_pointer = load %struct.node** %n2
  call void @addEdge(%struct.graph* %g116, %struct.node* %e1_val_pointer, %struct.node* %e2_val_pointer, i32 2)
  %g117 = load %struct.graph** %g1
  %n118 = load %struct.node** %n1
  %n219 = load %struct.node** %n2
  %getWeight = call i32 @getWeight(%struct.graph* %g117, %struct.node* %n118, %struct.node* %n219)
  store i32 %getWeight, i32* %x
  %x20 = load i32* %x
  %printf21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @fmt, i32 0, i32 0), i32 %x20)
  %g122 = load %struct.graph** %g1
  call void @printGraph(%struct.graph* %g122)
  %n123 = load %struct.node** %n1
  %getOutNodes = call %struct.List* @get_outNodes(%struct.node* %n123)
  store %struct.List* %getOutNodes, %struct.List** %l
  %l24 = load %struct.List** %l
  call void @print_list(%struct.List* %l24)
  %l25 = load %struct.List** %l
  %2 = call i32 @l_size(%struct.List* %l25)
  store i32 %2, i32* %y
  %y26 = load i32* %y
  %printf27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @fmt, i32 0, i32 0), i32 %y26)
  ret i32 0
}

declare noalias i8* @malloc(i32)
