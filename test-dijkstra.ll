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
%nodedata = type <{ %struct.node*, i32 }>

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
@str13 = private unnamed_addr constant [17 x i8] c"temporary string\00"
@str14 = private unnamed_addr constant [41 x i8] c"Vertex              Distance from source\00"
@str15 = private unnamed_addr constant [24 x i8] c"                       \00"

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
  %listtemp2 = alloca %struct.List*
  %g1 = alloca %struct.graph*
  %a1 = alloca i8*
  %a2 = alloca i8*
  %a3 = alloca i8*
  %a4 = alloca i8*
  %stringtmp = alloca i8*
  %i = alloca i32
  %n1 = alloca %nodedata
  %n2 = alloca %nodedata
  %n3 = alloca %nodedata
  %n4 = alloca %nodedata
  %a = alloca %struct.node*
  %b = alloca %struct.node*
  %c = alloca %struct.node*
  %d = alloca %struct.node*
  %struct_field_pointer = getelementptr inbounds %nodedata* %n1, i32 0, i32 1
  store i32 1000000, i32* %struct_field_pointer
  %struct_field_pointer1 = getelementptr inbounds %nodedata* %n2, i32 0, i32 1
  store i32 1000000, i32* %struct_field_pointer1
  %struct_field_pointer2 = getelementptr inbounds %nodedata* %n3, i32 0, i32 1
  store i32 1000000, i32* %struct_field_pointer2
  %struct_field_pointer3 = getelementptr inbounds %nodedata* %n4, i32 0, i32 1
  store i32 1000000, i32* %struct_field_pointer3
  store i8* getelementptr inbounds ([2 x i8]* @str, i32 0, i32 0), i8** %a1
  store i8* getelementptr inbounds ([2 x i8]* @str5, i32 0, i32 0), i8** %a2
  store i8* getelementptr inbounds ([2 x i8]* @str6, i32 0, i32 0), i8** %a3
  store i8* getelementptr inbounds ([2 x i8]* @str7, i32 0, i32 0), i8** %a4
  %init = call %struct.graph* @g_init()
  store %struct.graph* %init, %struct.graph** %g1
  %char_n_val_pointer = load i8** %a1
  %init4 = call %struct.node* @n_init(i8* %char_n_val_pointer)
  %node_alloca = alloca %struct.node*
  store %struct.node* %init4, %struct.node** %node_alloca
  %graph_pointer = load %struct.graph** %g1
  %node_pointer = load %struct.node** %node_alloca
  call void @addNode(%struct.graph* %graph_pointer, %struct.node* %node_pointer)
  %char_n_val_pointer5 = load i8** %a2
  %init6 = call %struct.node* @n_init(i8* %char_n_val_pointer5)
  %node_alloca7 = alloca %struct.node*
  store %struct.node* %init6, %struct.node** %node_alloca7
  %graph_pointer8 = load %struct.graph** %g1
  %node_pointer9 = load %struct.node** %node_alloca7
  call void @addNode(%struct.graph* %graph_pointer8, %struct.node* %node_pointer9)
  %char_n_val_pointer10 = load i8** %a3
  %init11 = call %struct.node* @n_init(i8* %char_n_val_pointer10)
  %node_alloca12 = alloca %struct.node*
  store %struct.node* %init11, %struct.node** %node_alloca12
  %graph_pointer13 = load %struct.graph** %g1
  %node_pointer14 = load %struct.node** %node_alloca12
  call void @addNode(%struct.graph* %graph_pointer13, %struct.node* %node_pointer14)
  %char_n_val_pointer15 = load i8** %a4
  %init16 = call %struct.node* @n_init(i8* %char_n_val_pointer15)
  %node_alloca17 = alloca %struct.node*
  store %struct.node* %init16, %struct.node** %node_alloca17
  %graph_pointer18 = load %struct.graph** %g1
  %node_pointer19 = load %struct.node** %node_alloca17
  call void @addNode(%struct.graph* %graph_pointer18, %struct.node* %node_pointer19)
  %g120 = load %struct.graph** %g1
  %char_n_val_pointer21 = load i8** %a1
  %0 = call %struct.node* @getNode(%struct.graph* %g120, i8* %char_n_val_pointer21)
  store %struct.node* %0, %struct.node** %a
  %g122 = load %struct.graph** %g1
  %char_n_val_pointer23 = load i8** %a2
  %1 = call %struct.node* @getNode(%struct.graph* %g122, i8* %char_n_val_pointer23)
  store %struct.node* %1, %struct.node** %b
  %g124 = load %struct.graph** %g1
  %char_n_val_pointer25 = load i8** %a3
  %2 = call %struct.node* @getNode(%struct.graph* %g124, i8* %char_n_val_pointer25)
  store %struct.node* %2, %struct.node** %c
  %g126 = load %struct.graph** %g1
  %char_n_val_pointer27 = load i8** %a4
  %3 = call %struct.node* @getNode(%struct.graph* %g126, i8* %char_n_val_pointer27)
  store %struct.node* %3, %struct.node** %d
  %a28 = load %struct.node** %a
  %n129 = load %nodedata* %n1
  %malloccall = tail call i8* @malloc(i32 ptrtoint (%nodedata* getelementptr (%nodedata* null, i32 1) to i32))
  %tmp = bitcast i8* %malloccall to %nodedata*
  store %nodedata %n129, %nodedata* %tmp
  %ptr = bitcast %nodedata* %tmp to i8*
  call void @set_data(%struct.node* %a28, i8* %ptr)
  %g130 = load %struct.graph** %g1
  %e1_val_pointer = load %struct.node** %a
  %e2_val_pointer = load %struct.node** %b
  call void @addEdge(%struct.graph* %g130, %struct.node* %e1_val_pointer, %struct.node* %e2_val_pointer, i32 1)
  %g131 = load %struct.graph** %g1
  %e1_val_pointer32 = load %struct.node** %a
  %e2_val_pointer33 = load %struct.node** %c
  call void @addEdge(%struct.graph* %g131, %struct.node* %e1_val_pointer32, %struct.node* %e2_val_pointer33, i32 2)
  %b34 = load %struct.node** %b
  %n235 = load %nodedata* %n2
  %malloccall36 = tail call i8* @malloc(i32 ptrtoint (%nodedata* getelementptr (%nodedata* null, i32 1) to i32))
  %tmp37 = bitcast i8* %malloccall36 to %nodedata*
  store %nodedata %n235, %nodedata* %tmp37
  %ptr38 = bitcast %nodedata* %tmp37 to i8*
  call void @set_data(%struct.node* %b34, i8* %ptr38)
  %g139 = load %struct.graph** %g1
  %e1_val_pointer40 = load %struct.node** %b
  %e2_val_pointer41 = load %struct.node** %a
  call void @addEdge(%struct.graph* %g139, %struct.node* %e1_val_pointer40, %struct.node* %e2_val_pointer41, i32 1)
  %g142 = load %struct.graph** %g1
  %e1_val_pointer43 = load %struct.node** %b
  %e2_val_pointer44 = load %struct.node** %d
  call void @addEdge(%struct.graph* %g142, %struct.node* %e1_val_pointer43, %struct.node* %e2_val_pointer44, i32 10)
  %c45 = load %struct.node** %c
  %n346 = load %nodedata* %n3
  %malloccall47 = tail call i8* @malloc(i32 ptrtoint (%nodedata* getelementptr (%nodedata* null, i32 1) to i32))
  %tmp48 = bitcast i8* %malloccall47 to %nodedata*
  store %nodedata %n346, %nodedata* %tmp48
  %ptr49 = bitcast %nodedata* %tmp48 to i8*
  call void @set_data(%struct.node* %c45, i8* %ptr49)
  %g150 = load %struct.graph** %g1
  %e1_val_pointer51 = load %struct.node** %c
  %e2_val_pointer52 = load %struct.node** %a
  call void @addEdge(%struct.graph* %g150, %struct.node* %e1_val_pointer51, %struct.node* %e2_val_pointer52, i32 2)
  %g153 = load %struct.graph** %g1
  %e1_val_pointer54 = load %struct.node** %c
  %e2_val_pointer55 = load %struct.node** %d
  call void @addEdge(%struct.graph* %g153, %struct.node* %e1_val_pointer54, %struct.node* %e2_val_pointer55, i32 5)
  %d56 = load %struct.node** %d
  %n457 = load %nodedata* %n4
  %malloccall58 = tail call i8* @malloc(i32 ptrtoint (%nodedata* getelementptr (%nodedata* null, i32 1) to i32))
  %tmp59 = bitcast i8* %malloccall58 to %nodedata*
  store %nodedata %n457, %nodedata* %tmp59
  %ptr60 = bitcast %nodedata* %tmp59 to i8*
  call void @set_data(%struct.node* %d56, i8* %ptr60)
  %g161 = load %struct.graph** %g1
  %e1_val_pointer62 = load %struct.node** %d
  %e2_val_pointer63 = load %struct.node** %b
  call void @addEdge(%struct.graph* %g161, %struct.node* %e1_val_pointer62, %struct.node* %e2_val_pointer63, i32 10)
  %g164 = load %struct.graph** %g1
  %e1_val_pointer65 = load %struct.node** %d
  %e2_val_pointer66 = load %struct.node** %c
  call void @addEdge(%struct.graph* %g164, %struct.node* %e1_val_pointer65, %struct.node* %e2_val_pointer66, i32 5)
  %a67 = load %struct.node** %a
  %g168 = load %struct.graph** %g1
  call void @dijkstra(%struct.graph* %g168, %struct.node* %a67)
  ret i32 0
}

define void @dijkstra(%struct.graph* %g1, %struct.node* %source) {
entry:
  %g11 = alloca %struct.graph*
  store %struct.graph* %g1, %struct.graph** %g11
  %source2 = alloca %struct.node*
  store %struct.node* %source, %struct.node** %source2
  %p = alloca %struct.pqueue*
  %sourcedata = alloca %nodedata
  %sourcedata2 = alloca %nodedata
  %temp = alloca %struct.node*
  %temp2 = alloca %struct.node*
  %tmpstring = alloca i8*
  %listtemp = alloca %struct.List*
  %i = alloca i32
  %init = call %struct.List* @l_init()
  store %struct.List* %init, %struct.List** %listtemp
  %init3 = call %struct.pqueue* @pq_init()
  store %struct.pqueue* %init3, %struct.pqueue** %p
  store i8* getelementptr inbounds ([17 x i8]* @str13, i32 0, i32 0), i8** %tmpstring
  %source4 = load %struct.node** %source2
  %getData = call i8* @get_data(%struct.node* %source4)
  %d_ptr = bitcast i8* %getData to %nodedata*
  %d_ptr5 = load %nodedata* %d_ptr
  store %nodedata %d_ptr5, %nodedata* %sourcedata
  %struct_field_pointer = getelementptr inbounds %nodedata* %sourcedata, i32 0, i32 1
  store i32 0, i32* %struct_field_pointer
  %source6 = load %struct.node** %source2
  %sourcedata7 = load %nodedata* %sourcedata
  %malloccall = tail call i8* @malloc(i32 ptrtoint (%nodedata* getelementptr (%nodedata* null, i32 1) to i32))
  %tmp = bitcast i8* %malloccall to %nodedata*
  store %nodedata %sourcedata7, %nodedata* %tmp
  %ptr = bitcast %nodedata* %tmp to i8*
  call void @set_data(%struct.node* %source6, i8* %ptr)
  %p8 = load %struct.pqueue** %p
  %source9 = load %struct.node** %source2
  call void @pq_push(%struct.pqueue* %p8, %struct.node* %source9)
  %printf = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @fmt9, i32 0, i32 0), i8* getelementptr inbounds ([41 x i8]* @str14, i32 0, i32 0))
  br label %while

while:                                            ; preds = %merge65, %entry
  %p66 = load %struct.pqueue** %p
  %isEmpty = call i32 @p_size(%struct.pqueue* %p66)
  %tmp67 = icmp ne i32 %isEmpty, 0
  br i1 %tmp67, label %while_body, label %merge68

while_body:                                       ; preds = %while
  %p10 = load %struct.pqueue** %p
  %data = call %struct.node* @pq_delete(%struct.pqueue* %p10)
  store %struct.node* %data, %struct.node** %temp
  %temp11 = load %struct.node** %temp
  %getName = call i8* @get_name(%struct.node* %temp11)
  %printf12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @fmt11, i32 0, i32 0), i8* %getName)
  %printf13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @fmt11, i32 0, i32 0), i8* getelementptr inbounds ([24 x i8]* @str15, i32 0, i32 0))
  %temp14 = load %struct.node** %temp
  %getData15 = call i8* @get_data(%struct.node* %temp14)
  %d_ptr16 = bitcast i8* %getData15 to %nodedata*
  %d_ptr17 = load %nodedata* %d_ptr16
  store %nodedata %d_ptr17, %nodedata* %sourcedata
  %struct_field_pointer18 = getelementptr inbounds %nodedata* %sourcedata, i32 0, i32 1
  %struct_field_value = load i32* %struct_field_pointer18
  %printf19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @fmt8, i32 0, i32 0), i32 %struct_field_value)
  %temp20 = load %struct.node** %temp
  call void @modify_visited(%struct.node* %temp20, i1 true)
  %temp21 = load %struct.node** %temp
  %getOutNodes = call %struct.List* @get_outNodes(%struct.node* %temp21)
  store %struct.List* %getOutNodes, %struct.List** %listtemp
  store i32 0, i32* %i
  br label %while22

while22:                                          ; preds = %merge, %while_body
  %i62 = load i32* %i
  %listtemp63 = load %struct.List** %listtemp
  %0 = call i32 @l_size(%struct.List* %listtemp63)
  %tmp64 = icmp slt i32 %i62, %0
  br i1 %tmp64, label %while_body23, label %merge65

while_body23:                                     ; preds = %while22
  %listtemp24 = load %struct.List** %listtemp
  %i25 = load i32* %i
  %val_ptr = call i8* @l_get(%struct.List* %listtemp24, i32 %i25)
  store i8* %val_ptr, i8** %tmpstring
  %g126 = load %struct.graph** %g11
  %char_n_val_pointer = load i8** %tmpstring
  %1 = call %struct.node* @getNode(%struct.graph* %g126, i8* %char_n_val_pointer)
  store %struct.node* %1, %struct.node** %temp2
  %temp227 = load %struct.node** %temp2
  %getData28 = call i8* @get_data(%struct.node* %temp227)
  %d_ptr29 = bitcast i8* %getData28 to %nodedata*
  %d_ptr30 = load %nodedata* %d_ptr29
  store %nodedata %d_ptr30, %nodedata* %sourcedata2
  %temp231 = load %struct.node** %temp2
  %getVisited = call i1 @get_visited(%struct.node* %temp231)
  %tmp32 = icmp eq i1 %getVisited, false
  br i1 %tmp32, label %then, label %else59

merge:                                            ; preds = %else59, %merge42
  %i60 = load i32* %i
  %tmp61 = add i32 %i60, 1
  store i32 %tmp61, i32* %i
  br label %while22

then:                                             ; preds = %while_body23
  %struct_field_pointer33 = getelementptr inbounds %nodedata* %sourcedata2, i32 0, i32 1
  %struct_field_value34 = load i32* %struct_field_pointer33
  %struct_field_pointer35 = getelementptr inbounds %nodedata* %sourcedata, i32 0, i32 1
  %struct_field_value36 = load i32* %struct_field_pointer35
  %g137 = load %struct.graph** %g11
  %temp38 = load %struct.node** %temp
  %temp239 = load %struct.node** %temp2
  %getWeight = call i32 @getWeight(%struct.graph* %g137, %struct.node* %temp38, %struct.node* %temp239)
  %tmp40 = add i32 %struct_field_value36, %getWeight
  %tmp41 = icmp sgt i32 %struct_field_value34, %tmp40
  br i1 %tmp41, label %then43, label %else

merge42:                                          ; preds = %else, %then43
  br label %merge

then43:                                           ; preds = %then
  %struct_field_pointer44 = getelementptr inbounds %nodedata* %sourcedata, i32 0, i32 1
  %struct_field_value45 = load i32* %struct_field_pointer44
  %g146 = load %struct.graph** %g11
  %temp47 = load %struct.node** %temp
  %temp248 = load %struct.node** %temp2
  %getWeight49 = call i32 @getWeight(%struct.graph* %g146, %struct.node* %temp47, %struct.node* %temp248)
  %tmp50 = add i32 %struct_field_value45, %getWeight49
  %struct_field_pointer51 = getelementptr inbounds %nodedata* %sourcedata2, i32 0, i32 1
  store i32 %tmp50, i32* %struct_field_pointer51
  %temp252 = load %struct.node** %temp2
  %sourcedata253 = load %nodedata* %sourcedata2
  %malloccall54 = tail call i8* @malloc(i32 ptrtoint (%nodedata* getelementptr (%nodedata* null, i32 1) to i32))
  %tmp55 = bitcast i8* %malloccall54 to %nodedata*
  store %nodedata %sourcedata253, %nodedata* %tmp55
  %ptr56 = bitcast %nodedata* %tmp55 to i8*
  call void @set_data(%struct.node* %temp252, i8* %ptr56)
  %p57 = load %struct.pqueue** %p
  %temp258 = load %struct.node** %temp2
  call void @pq_push(%struct.pqueue* %p57, %struct.node* %temp258)
  br label %merge42

else:                                             ; preds = %then
  br label %merge42

else59:                                           ; preds = %while_body23
  br label %merge

merge65:                                          ; preds = %while22
  br label %while

merge68:                                          ; preds = %while
  ret void
}

declare noalias i8* @malloc(i32)
