
install.packages("igraph")
library(igraph)

# Function to update family codes based on relations
update_family_codes <- function(data) {
  # Create a graph
  g <- graph.empty(directed = FALSE)
  
  # Add vertices (individuals)
  g <- add_vertices(g, nrow(data), name = 1:nrow(data))
  
  # Add edges based on parent relationships
  for (i in 1:nrow(data)) {
    for (j in 1:nrow(data)) {
      if (i != j && (data$Mother_name[i] == data$Mother_name[j] || data$Father_name[i] == data$Father_name[j])) {
        g <- add_edges(g, c(i, j))
      }
    }
  }
  
  # Find connected components
  components <- clusters(g)$membership
  
  # Assign family codes based on connected components
  for (i in 1:length(components)) {
    data$Family_code[i] <- paste0("n", components[i])
  }
  
  return(data)
}

# Example 1: Sample dataset
data1 <- data.frame(
  Family_code = c("n1", "n2", "n3"),
  Mother_name = c("Laura", "Katty", "Katty"),
  Father_name = c("Mourinho", "Ferguson", "Mourinho")
)

# Update family codes for Example 1
updated_data1 <- update_family_codes(data1)
print(updated_data1)

# Example 2: Another dataset
data2 <- data.frame(
  Family_code = c("n1", "n2", "n3", "n4"),
  Mother_name = c("Laura", "Katty", "Laura", "Katty"),
  Father_name = c("Mourinho", "Ferguson", "Ferguson", "Mourinho")
)

# Update family codes for Example 2
updated_data2 <- update_family_codes(data2)
print(updated_data2)

# Example 3: Yet another dataset
data3 <- data.frame(
  Family_code = c("n1", "n2", "n3", "n4", "n5"),
  Mother_name = c("Laura", "Katty", "Laura", "Katty", "Laura"),
  Father_name = c("Mourinho", "Ferguson", "Ferguson", "Mourinho", "Mourinho")
)

# Update family codes for Example 3
updated_data3 <- update_family_codes(data3)
print(updated_data3)


# Example 4: Yet another dataset
data4 <- data.frame(
  Family_code = c("n1", "n2", "n3", "n4", "n5"),
  Mother_name = c("Laura", "Katty", "Isabelle", "Carole", "Sandra"),
  Father_name = c("Mourinho", "Ferguson", "Guardiola", "Ancelotti", "Simeone")
)

# Update family codes for Example 4
updated_data4 <- update_family_codes(data4)
print(updated_data4)


# Example 5: Yet another dataset
data5 <- data.frame(
  Family_code = c("n1", "n2", "n3", "n4", "n5"),
  Mother_name = c("Laura", "Katty", "Isabelle", "Carole", "Sandra"),
  Father_name = c("Mourinho", "Ferguson", "Guardiola", "Ancelotti", "Simeone"),
  Sister_name = c("Anna", "Beth", "Clara", "Diana", "Eva")
)

# Update family codes for Example 5
updated_data5 <- update_family_codes(data5)
print(updated_data5)


# Example 6: Yet another dataset
data6 <- data.frame(
  Family_code = c("n1", "n2", "n3", "n4", "n5"),
  Mother_name = c("Laura", "Katty", "Isabelle", "Carole", "Katty"),
  Father_name = c("Mourinho", "Mourinho", "Guardiola", "Ancelotti", "Simeone"),
  Sister_name = c("Anna", "Anna", "Clara", "Diana", "Eva")
)

# Update family codes for Example 6
updated_data6 <- update_family_codes(data6)
print(updated_data6)




