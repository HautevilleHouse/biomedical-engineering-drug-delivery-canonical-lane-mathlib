import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringDrugDeliveryCanonicalLaneLean

structure AdmissibleClass where
  object : DrugDeliveryAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  DrugDeliveryWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BiomedicalEngineeringDrugDeliveryCanonicalLaneLean
end HautevilleHouse