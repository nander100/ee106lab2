def neighbors(current):
    neighbors = [[-1,0],[0,-1],[0,1],[1,0]]
    return [(current[0]+nbr[0],current[1]+nbr[1])for nbr in neighbors]

def heuristic_distance (candidate,goal):
    return abs(candidate[0]-goal[0])+abs(candidate[1]-goal[1])

def get_path_from_A_star(start,goal,obstacles):
    path = []
    # The open list contains all the nodes that are being considered for exploration
    # Each node in the open list is a tuple of (cost, node)
    # The cost is the sum of the past cost and the heuristic distance to the goal
    open = [(0,start)] #initialize openlist

    # The closed list contains all the nodes that have already been explored
    # The closed list is used to avoid exploring the same node multiple times
    # The closed list is a list of nodes
    closed = [] #initially empty

    # The past cost dictionary contains the cost of reaching each node from the start node
    # The past cost is used to determine the cost of reaching a node from the start node
    # This is important to determine the least cost path to the goal
    past_cost = {}

    # Check if the start and goal nodes are valid
    if start in obstacles:
        raise Exception('Start is an obstacle')
    if goal in obstacles:
        raise Exception('Goal is an obstacle')
    
    # At the beginning of the algorithm, the past cost of the start node is 0
    past_cost[start] = 0 

    # This is a dictionary that keeps track of the parent of each node 
    # This is used to reconstruct the path from the start node to the goal node
    parent = {}
    parent[start] = None # The parent of the start node is None because it is the root node
    
    # The main loop of the A* algorithm
    # The loop continues until there are no more nodes to explore in the open list
    while len(open)!= 0:
        
        #sort based on cost, this is a very important step to ensure that the algorithm expands the least cost node first
        open.sort() 
        
        #set current node as the least cost node in the open list
        current = open.pop(0)[1] 

        # After the node is expanded, it is added to the closed list to make sure it is not explored again
        closed.append(current)

        # Check if the current node is the goal node
        if current == goal:

            # Reconstruct the path from the start node to the goal node
            # The path is reconstructed by following the parent nodes from the goal node to the start node
            while current!=start:
                path.append(current)
                current = parent[current]
            path.reverse() #based on parent
            return path
        
        # Since the goal node is not reached yet, we need to explore the neighbors of the current node
        # The neighbors of the current node are the nodes that are adjacent to it calculated by neighbors()
        for candidate in neighbors(current):
            #check if candidate is an obsticle, if so, 'continue'
            if candidate in obstacles:
                continue
            #check if candidate is not in closed list
            if candidate in closed:
                continue
            
            # The cost from the start to the current node is the past cost of the current node plus the cost of moving to the candidate node (1)
            new_cost = past_cost[current] + 1 # define new_cost
            
            # a new node has been discovered 
            # if it is not in the list of past path costs or has a smaller cost than the previous one
            # Update the past cost of the candidate node and add it to the open list
            if candidate not in past_cost or new_cost<past_cost[candidate]:
                past_cost[candidate] = past_cost[current] + 1
                parent[candidate] = current

                # Astar wants to explore the nodes that are closest to the goal first
                # It does this by calculating the heuristic distance from the candidate node to the goal node
                # The heuristic distance is the Manhattan distance between the candidate node and the goal node
                # Since the open list is sorted by cost, we can add the candidate node to the open list with its estimated cost
                h_dist = heuristic_distance(candidate, goal)

                # The estimated cost is the sum of the past cost and the heuristic distance
                # This is the cost that A* uses to determine the order in which to explore the nodes
                est_cost = past_cost[candidate] + h_dist    

                # Add the candidate node to the open list with its estimated cost
                open.append((est_cost,candidate))

            # This prosses repeats until the goal node is reached or there are no more nodes to explore in the open list
    raise Exception ('We never got to the goal')
