import canonicalLaneMathlib.BridgeLemmas

namespace HautevilleHouse
namespace BiomedicalEngineeringDrugDeliveryCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  DrugDeliveryWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end BiomedicalEngineeringDrugDeliveryCanonicalLaneLean
end HautevilleHouse