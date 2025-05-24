def neighbors(current):
    neighbors = [[-1,0],[0,-1],[0,1],[1,0]]
    return [(current[0]+nbr[0],current[1]+nbr[1])for nbr in neighbors]

def heuristic_distance (candidate,goal):
    return abs(candidate[0]-goal[0])+abs(candidate[1]-goal[1])

def get_path_from_A_star(start,goal,obstacles):
    path = []
    open = [(0,start)] #initialize openlist
    closed = [] #initially empty
    past_cost = {}
    if goal in obstacles:
        raise Exception('Goal is an obsticle')
    past_cost[start] = 0 #at the start, no past cost
    parent = {}
    parent[start] = None
    while len(open)!=0: #we can still have nodes to explore
        open.sort() #sort based on cost
        current = open.pop(0)[1] #set current
        closed.append(current)
        if current == goal: #if at the goal
            while current!=start:
                path.append(current)
                current = parent[current]
            path.reverse() #based on parent
            return path
        for candidate in neighbors(current):
            #check if candidate is an obsticle, if so, 'continue'
            if candidate in obstacles:
                continue
            #check if candidate is not in closed list
            if candidate in closed:
                continue
            
            new_cost = past_cost[current] + 1# define new_cost
            
            # a new node has been discovered
            if candidate not in past_cost or new_cost<past_cost[candidate]:
                past_cost[candidate] = past_cost[current] + 1
                parent[candidate] = current
                h_dist = heuristic_distance(candidate, goal)
                est_cost = past_cost[candidate] + h_dist 
                open.append((est_cost,candidate))
    raise Exception ('We never got to the goal')
